@echo on
git clone https://github.com/microsoft/vcpkg.git
vcpkg\bootstrap-vcpkg.bat

%PYTHON% -m pip install python\ -v --no-build-isolation