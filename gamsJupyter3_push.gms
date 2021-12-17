$gdxin %dataFromJupyter%
$if     defined obs $loadR obs
$if not defined obs $load  obs
$if     defined mat $loadR mat
$if not defined mat $load  mat
$if     defined dim $loadR dim
$if not defined dim $load  dim
$gdxin