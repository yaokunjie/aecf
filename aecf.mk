##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=aecf
ConfigurationName      :=Debug
WorkspacePath          :=E:/CodeLite/AHRS
ProjectPath            :=E:/CodeLite/AHRS/aecf
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=YaoKunJie
Date                   :=03/09/2016
CodeLitePath           :="H:/Program Files/CodeLite"
LinkerName             :=H:/ProgramFiles/Compiler/Linaro/bin/arm-linux-gnueabihf-g++.exe
SharedObjectLinkerName :=H:/ProgramFiles/Compiler/Linaro/bin/arm-linux-gnueabihf-g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="aecf.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=windres
LinkOptions            :=  -O0
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)E:\CodeLite\AHRS\aecf\header $(IncludeSwitch)H:\ProgramFiles\CodeLibary\boost_1_61_0 $(IncludeSwitch)H:\ProgramFiles\CodeLibary\pcduino 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)arduino 
ArLibs                 :=  "arduino" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch). $(LibraryPathSwitch)Debug $(LibraryPathSwitch)H:\ProgramFiles\CodeLibary\pcduinoLib 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := H:/ProgramFiles/Compiler/Linaro/bin/arm-linux-gnueabihf-ar.exe rcu
CXX      := H:/ProgramFiles/Compiler/Linaro/bin/arm-linux-gnueabihf-g++.exe
CC       := H:/ProgramFiles/Compiler/Linaro/bin/arm-linux-gnueabihf-gcc.exe
CXXFLAGS :=  -g -Wall -std=c++11 -pthread  $(Preprocessors)
CFLAGS   :=   $(Preprocessors)
ASFLAGS  := 
AS       := H:/ProgramFiles/Compiler/Linaro/bin/arm-linux-gnueabihf-as.exe


##
## User defined environment variables
##
CodeLiteDir:=H:\Program Files\CodeLite
Objects0=$(IntermediateDirectory)/src_AHRS.cpp$(ObjectSuffix) $(IntermediateDirectory)/src_hmc5883l.cpp$(ObjectSuffix) $(IntermediateDirectory)/src_main.cpp$(ObjectSuffix) $(IntermediateDirectory)/src_motorcontrol.cpp$(ObjectSuffix) $(IntermediateDirectory)/src_mpu6050.cpp$(ObjectSuffix) $(IntermediateDirectory)/src_Quaternion.cpp$(ObjectSuffix) $(IntermediateDirectory)/src_sensor.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/src_AHRS.cpp$(ObjectSuffix): src/AHRS.cpp $(IntermediateDirectory)/src_AHRS.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "E:/CodeLite/AHRS/aecf/src/AHRS.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_AHRS.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_AHRS.cpp$(DependSuffix): src/AHRS.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_AHRS.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_AHRS.cpp$(DependSuffix) -MM src/AHRS.cpp

$(IntermediateDirectory)/src_AHRS.cpp$(PreprocessSuffix): src/AHRS.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_AHRS.cpp$(PreprocessSuffix)src/AHRS.cpp

$(IntermediateDirectory)/src_hmc5883l.cpp$(ObjectSuffix): src/hmc5883l.cpp $(IntermediateDirectory)/src_hmc5883l.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "E:/CodeLite/AHRS/aecf/src/hmc5883l.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hmc5883l.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hmc5883l.cpp$(DependSuffix): src/hmc5883l.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hmc5883l.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hmc5883l.cpp$(DependSuffix) -MM src/hmc5883l.cpp

$(IntermediateDirectory)/src_hmc5883l.cpp$(PreprocessSuffix): src/hmc5883l.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hmc5883l.cpp$(PreprocessSuffix)src/hmc5883l.cpp

$(IntermediateDirectory)/src_main.cpp$(ObjectSuffix): src/main.cpp $(IntermediateDirectory)/src_main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "E:/CodeLite/AHRS/aecf/src/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_main.cpp$(DependSuffix): src/main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_main.cpp$(DependSuffix) -MM src/main.cpp

$(IntermediateDirectory)/src_main.cpp$(PreprocessSuffix): src/main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_main.cpp$(PreprocessSuffix)src/main.cpp

$(IntermediateDirectory)/src_motorcontrol.cpp$(ObjectSuffix): src/motorcontrol.cpp $(IntermediateDirectory)/src_motorcontrol.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "E:/CodeLite/AHRS/aecf/src/motorcontrol.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_motorcontrol.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_motorcontrol.cpp$(DependSuffix): src/motorcontrol.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_motorcontrol.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_motorcontrol.cpp$(DependSuffix) -MM src/motorcontrol.cpp

$(IntermediateDirectory)/src_motorcontrol.cpp$(PreprocessSuffix): src/motorcontrol.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_motorcontrol.cpp$(PreprocessSuffix)src/motorcontrol.cpp

$(IntermediateDirectory)/src_mpu6050.cpp$(ObjectSuffix): src/mpu6050.cpp $(IntermediateDirectory)/src_mpu6050.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "E:/CodeLite/AHRS/aecf/src/mpu6050.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_mpu6050.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_mpu6050.cpp$(DependSuffix): src/mpu6050.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_mpu6050.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_mpu6050.cpp$(DependSuffix) -MM src/mpu6050.cpp

$(IntermediateDirectory)/src_mpu6050.cpp$(PreprocessSuffix): src/mpu6050.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_mpu6050.cpp$(PreprocessSuffix)src/mpu6050.cpp

$(IntermediateDirectory)/src_Quaternion.cpp$(ObjectSuffix): src/Quaternion.cpp $(IntermediateDirectory)/src_Quaternion.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "E:/CodeLite/AHRS/aecf/src/Quaternion.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_Quaternion.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_Quaternion.cpp$(DependSuffix): src/Quaternion.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_Quaternion.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_Quaternion.cpp$(DependSuffix) -MM src/Quaternion.cpp

$(IntermediateDirectory)/src_Quaternion.cpp$(PreprocessSuffix): src/Quaternion.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_Quaternion.cpp$(PreprocessSuffix)src/Quaternion.cpp

$(IntermediateDirectory)/src_sensor.cpp$(ObjectSuffix): src/sensor.cpp $(IntermediateDirectory)/src_sensor.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "E:/CodeLite/AHRS/aecf/src/sensor.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_sensor.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_sensor.cpp$(DependSuffix): src/sensor.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_sensor.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_sensor.cpp$(DependSuffix) -MM src/sensor.cpp

$(IntermediateDirectory)/src_sensor.cpp$(PreprocessSuffix): src/sensor.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_sensor.cpp$(PreprocessSuffix)src/sensor.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


