#!/bin/bash

# 1. Activate your Anaconda environment (replace 'your_env_name' with your actual environment name)
conda init
conda activate fresh_flask

# 2. Find the site-packages directory for the activated environment
site_packages_dir=$(python -c "import site; print(site.getsitepackages()[0])")

# 3. Find the bin directory for the activated environment
bin_dir=$(conda env list | grep "fresh_flask" | awk '{print $NF}')/bin

# 4. Add the site-packages directory to PYTHONPATH (temporarily, for the current shell)
export PYTHONPATH="$site_packages_dir:$PYTHONPATH"

# 5. Add the bin directory to PATH (temporarily, for the current shell)
export PATH="$bin_dir:$PATH"

# 6. Verify the changes (optional)
echo "PYTHONPATH: $PYTHONPATH"
echo "PATH: $PATH"

# 7. Verify the python package installation directory (optional)
echo "site-packages directory: $site_packages_dir"
echo "bin directory: $bin_dir"

# 8. Verify a package is found (optional)
python -c "import flask" # replace <your_package_name> with the package you want to verify.

python app.py