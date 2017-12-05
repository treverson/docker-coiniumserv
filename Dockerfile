FROM mono:latest

ENV INSTALL_PATH=/usr/src/app/

WORKDIR $INSTALL_PATH

ADD https://github.com/bonesoul/CoiniumServ/archive/master.tar.gz $INSTAL_PATH

RUN nuget restore -NoCache -DisableParallelProcessing $INSTALL_PATH/CoiniumServ-master/build/CoiniumServ.sln

RUN xbuild $INSTALL_PATH/CoiniumServ-master/build/CoiniumServ.sln /p:Configuration="Release"

#RUN mono contrib/xunit/xunit.console.clr4.x86.exe src/Tests/bin/Release/CoiniumServ.Tests.dll
