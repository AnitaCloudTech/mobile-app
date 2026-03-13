param(
  [int]$Port = 5199
)

$root = Join-Path $PSScriptRoot 'build\web'
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://127.0.0.1:$Port/")
$listener.Start()
Write-Host "Serving $root on http://127.0.0.1:$Port"

$mimeTypes = @{
  '.html' = 'text/html'
  '.js' = 'application/javascript'
  '.css' = 'text/css'
  '.json' = 'application/json'
  '.png' = 'image/png'
  '.jpg' = 'image/jpeg'
  '.jpeg' = 'image/jpeg'
  '.svg' = 'image/svg+xml'
  '.ico' = 'image/x-icon'
  '.wasm' = 'application/wasm'
  '.ttf' = 'font/ttf'
  '.otf' = 'font/otf'
  '.txt' = 'text/plain'
}

while ($listener.IsListening) {
  $context = $listener.GetContext()
  $requestPath = $context.Request.Url.AbsolutePath.TrimStart('/')
  if ([string]::IsNullOrWhiteSpace($requestPath)) { $requestPath = 'index.html' }
  $filePath = Join-Path $root $requestPath

  if (!(Test-Path $filePath) -and $requestPath -notmatch '\.') {
    $filePath = Join-Path $root 'index.html'
  }

  if (Test-Path $filePath) {
    $bytes = [System.IO.File]::ReadAllBytes($filePath)
    $ext = [System.IO.Path]::GetExtension($filePath).ToLowerInvariant()
    $context.Response.ContentType = $mimeTypes[$ext]
    if (-not $context.Response.ContentType) { $context.Response.ContentType = 'application/octet-stream' }
    $context.Response.ContentLength64 = $bytes.Length
    $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
  } else {
    $context.Response.StatusCode = 404
  }

  $context.Response.OutputStream.Close()
}
