@echo off

rem Bypass "Terminate Batch Job" prompt.
if "%~1"=="-FIXED_CTRL_C" (
   REM Remove the -FIXED_CTRL_C parameter
   SHIFT
) ELSE (
   REM Run the batch with <NUL and -FIXED_CTRL_C
   CALL <NUL %0 -FIXED_CTRL_C %*
   GOTO :EOF
)

set PYTHON=
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS=--medvram
@REM set COMMANDLINE_ARGS=--lowvram
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --gradio-img2img-tool color-sketch --gradio-inpaint-tool color-sketch
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --listen
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --precision full --no-half --no-half-vae
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --xformers
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --deepdanbooru
set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --use-cpu interrogate
@REM set CUDA_VISIBLE_DEVICES=""
@REM set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --skip-torch-cuda-test
@REM set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --force-enable-xformers
@REM set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --use-cpu all

call webui.bat