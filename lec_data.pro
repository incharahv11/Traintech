name: Build Qt Project

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build-windows:
    runs-on: windows-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v4

    - name: Install Qt
      uses: jurplel/install-qt-action@v4
      with:
        version: '5.15.2'

    - name: Build project
      run: |
        qmake lec_data.pro
        mingw32-make

    - name: Upload executable
      uses: actions/upload-artifact@v4
      with:
        name: lec_data-windows
        path: |
          **/*.exe

