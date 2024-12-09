@echo off
echo ✅✅✅✅✅ See Dockerfile.sample for image definition. ✅✅✅✅✅
echo ENTRYPOINT: [ "echo", "Hey Team 👋 (entrypoint)" ]
echo CMD: [ "+ (cmd)" ]
call build-sample.bat
echo Run with no arguments:
docker run sample
echo ##############################
echo Run with argument (CMD is ignored):
docker run sample "+ (argument)"
echo ##############################
echo Overridden entrypoint with no arguments (CMD is ignored):
docker run --entrypoint echo sample
echo ##############################
echo Overridden entrypoint with arguments (CMD is ignored):
docker run --entrypoint echo sample "Hey Team 👋 (Overridden entrypoint + arguments)"
