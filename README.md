# digiKam Test Data

Data required to support running unit tests for digiKam source code reprository.
https://invent.kde.org/graphics/digikam/-/tree/master/core/tests

# Git Large File Storage (Git LFS)

This reprository use Git-lfs to handle large file storage
https://git-lfs.github.com/

## Working with Git LFS

This section is for developers who wish to add files to this repo.
All the commands listed below must be typed into a shell after changing to the directory holding this README.

You must install Git LFS on your system. For Ubuntu, uses "sudo apt install git-lfs".

### One-time setup (on each machine)

In the directory containing this README, type:

        git lfs install

### Check the files tracked

Git LFS identifies a "large file" by pattern matching.
This is often via a file extension, but can also be used to track entire directories.

Before comitting a large test file -- including any image, video, audio file -- do check that the
file extension is one that is currently tracked by LFS using:

      git lfs track

### Add file tracking pattern

To add a new extension "ext":

      git lfs track "*.ext"

The current set of tracked file extensions is located in file .gitattributes.
Thus the above command will update .gitattributes and you need to commit that change.

### Add a new file

Commit, push and work with the files normally:

      git add file.jpg
      git commit -m 'added file.jpg'
      git push

# File Descriptions

## core/tests/video/qtav/video

* basemediav1.mp4
  - downloaded from https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4
  - cut to 5 seconds using ffmpeg -i file_example_MP4_480_1_5MG.mp4 -t 5 basemediav1.mp4

* riffMpeg.avi
  - downloaded from https://file-examples.com/wp-content/uploads/2018/04/file_example_AVI_640_800kB.avi
  - cut to 5 seconds using ffmpeg -i file_example_AVI_640_800kB.avi -t 5 riffMpeg.avi

* mpeg2.mp4
  - created using ffmpeg -i basemediav1.mp4 -vcodec mpeg2video mpeg2.mp4

* mpeg4.mp4
  - created using ffmpeg -i basemediav1.mp4 -vcodec mpeg4 mpeg4.mp4

## core/tests/metadataengine

* Data test files (RAW, JPEG, PNG, TIF, etc.) to check the file metadata engine functionalities.

## core/tests/albummodel

* Data test files to check the database album model functionalities.

## core/tests/database

* Data test files to check the database low level operations.

## core/tests/dimg

* Data test files to check the digiKam DImg API.

## core/tests/faceengine

* Data test files for Faces Engine detections and recognitions..

# Rationale

Entries from Phabricator:

- https://phabricator.kde.org/T14540
- https://phabricator.kde.org/T15844
