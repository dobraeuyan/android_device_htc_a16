/*
 * Copyright (C) 2016 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

class BEAUTYSHOT_SCENARIO_t {};
class BEAUTYSHOT_EFFECT_t {};
struct camera_frame_metadata;
struct android_native_rect_t { int dummy; };

namespace android {
class CameraParameters;
class face_config_type;
class face_info_t;
class faceBeauty_config_type;
class multi_face_info_t;
struct camera_face;

class CameraFace {
public:
    CameraFace();
    ~CameraFace();

    void runFaceThread();
    int processPreview(unsigned char*, int, faceBeauty_config_type*, face_info_t*, multi_face_info_t*, camera_frame_metadata*);
    void runBeautyChatThread();
    void startSensorListener();
    int faceproc_engine_create(void*);
    int startFaceDetection(int, int);
    int getAsdFaceInfo(unsigned char*, int*, int, int, int*);
    int calculateFocusFace(camera_face*, int);
    void getZeroEditingFaceInfo(int, int, int, int, int&, int&, int&, int&, int&, int&, int&, int&, int&, int&, int&);
    void checkSensorDistortion(int);
    int initialize(face_config_type*);
    void stopSensorListener();
    int processImage(unsigned char*, int, int, int, faceBeauty_config_type*);
    void setFaceDtEvent(int);
    void setParameters(const CameraParameters&);
    void ZoomChanged(android_native_rect_t, bool);
    void setUndistortEvent(int, int, bool);
    void getParameters(CameraParameters&) const;
    void stopFaceDetection(int, int);
    void onOrientationEvent(unsigned int, unsigned int);
    void startOtCbThread();
    bool IsFaceRectUnderThreshold(const camera_frame_metadata&, const camera_frame_metadata&);
    void fd_util_exit(void*);
    void deInitialize();
    void setZoomRatio(float);
    void startFaceCbThread();
    void enableFaceCallback(bool);
    void runOtCbThread();
    void stopFaceCbThread();
    void stopOtCbThread();
    void isFocusFaceRectUnderThreshold(int*, int*);
    void getZEFaceInfo(camera_frame_metadata&, bool, bool, int, int, int, int, int&, int&, int&, int&, int&, int&, int&, int&, int&, int&, int&);
    void setUserTouchPoint(int, int, bool*, int);
    void setBeautyEvent(BEAUTYSHOT_SCENARIO_t, BEAUTYSHOT_EFFECT_t, int);
    void fd_callback_execute();
    void processFaceROI(multi_face_info_t*);
    void initBeautyChat();
    void fd_util_execute(void*);
    int MapFaceScore(int, int, int);
    void runFaceCbThread();
    void processPreview(unsigned char*, CameraParameters&, int, faceBeauty_config_type*, face_info_t*, multi_face_info_t*, camera_frame_metadata*);
    int getFaceDetectResult(unsigned char*, unsigned char*, int*, float, int, int);
};

CameraFace::CameraFace() { }
CameraFace::~CameraFace() { }
void CameraFace::runFaceThread() { }
int CameraFace::processPreview(unsigned char*, int, faceBeauty_config_type*, face_info_t*, multi_face_info_t*, camera_frame_metadata*) { return 0; }
void CameraFace::runBeautyChatThread() { }
void CameraFace::startSensorListener() { }
int CameraFace::faceproc_engine_create(void*) { return 0; }
int CameraFace::startFaceDetection(int, int) { return 0; }
int CameraFace::getAsdFaceInfo(unsigned char*, int*, int, int, int*) { return 0; }
int CameraFace::calculateFocusFace(camera_face*, int) { return 0; }
void CameraFace::getZeroEditingFaceInfo(int, int, int, int, int&, int&, int&, int&, int&, int&, int&, int&, int&, int&, int&) { }
void CameraFace::checkSensorDistortion(int) { }
int CameraFace::initialize(face_config_type*) { return 0; }
void CameraFace::stopSensorListener() { }
int CameraFace::processImage(unsigned char*, int, int, int, faceBeauty_config_type*) { return 0; }
void CameraFace::setFaceDtEvent(int) { }
void CameraFace::setParameters(const CameraParameters&) { }
void CameraFace::ZoomChanged(android_native_rect_t, bool) { }
void CameraFace::setUndistortEvent(int, int, bool) { }
void CameraFace::getParameters(CameraParameters&) const { }
void CameraFace::stopFaceDetection(int, int) { }
void CameraFace::onOrientationEvent(unsigned int, unsigned int) { }
void CameraFace::startOtCbThread() { }
bool CameraFace::IsFaceRectUnderThreshold(const camera_frame_metadata&, const camera_frame_metadata&) { return false; }
void CameraFace::fd_util_exit(void*) { }
void CameraFace::deInitialize() { }
void CameraFace::setZoomRatio(float) { }
void CameraFace::startFaceCbThread() { }
void CameraFace::enableFaceCallback(bool) { }
void CameraFace::runOtCbThread() { }
void CameraFace::stopFaceCbThread() { }
void CameraFace::stopOtCbThread() { }
void CameraFace::isFocusFaceRectUnderThreshold(int*, int*) { }
void CameraFace::getZEFaceInfo(camera_frame_metadata&, bool, bool, int, int, int, int, int&, int&, int&, int&, int&, int&, int&, int&, int&, int&, int&) { }
void CameraFace::setUserTouchPoint(int, int, bool*, int) { }
void CameraFace::setBeautyEvent(BEAUTYSHOT_SCENARIO_t, BEAUTYSHOT_EFFECT_t, int) { }
void CameraFace::fd_callback_execute() { }
void CameraFace::processFaceROI(multi_face_info_t*) { }
void CameraFace::initBeautyChat() { }
void CameraFace::fd_util_execute(void*) { }
int CameraFace::MapFaceScore(int, int, int) { return 0; }
void CameraFace::processPreview(unsigned char*, CameraParameters&, int, faceBeauty_config_type*, face_info_t*, multi_face_info_t*, camera_frame_metadata*) { }
int CameraFace::getFaceDetectResult(unsigned char*, unsigned char*, int*, float, int, int) { return 0; }

};
