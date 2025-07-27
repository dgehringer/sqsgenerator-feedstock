@echo on

:: Inspired by the numpy-feedstock build script:
:: https://github.com/conda-forge/numpy-feedstock/blob/main/recipe/bld.bat

git clone https://github.com/microsoft/vcpkg.git
call vcpkg/bootstrap-vcpkg.bat

:: -wnx flags mean: --wheel --no-isolation --skip-dependency-check
%PYTHON% -m build -w -n -x python\

if %ERRORLEVEL% neq 0 exit 1

:: `pip install dist\*.whl` does not work on windows,
:: so use a loop; there's only one wheel in dist/ anyway
for /f %%f in ('dir /b /S .\python\dist') do (
    pip install %%f
    if %ERRORLEVEL% neq 0 exit 1
)