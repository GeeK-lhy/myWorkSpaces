import { ZegoDataReport } from '../common/zego.datareport';
import { ZegoPreview } from './zego.preview';
import { MediaStreamConstraints, PlayOption, SignalInfo, ChargeInfos } from '../common/zego.entity';
import { ZegoStreamCenter } from '../common/ZegoStreamCenter';
import { LoggerWeb } from './zego.logger.webrtc';
import { StateCenter } from '../common/clientBase/stateCenter';
export declare class ZegoStreamCenterWeb extends ZegoStreamCenter {
    logger: LoggerWeb;
    dataReport: ZegoDataReport;
    stateCenter: StateCenter;
    testEnvironment: boolean;
    heartbeatTimer: any;
    heartbeatInterval: number;
    chargeInfos: ChargeInfos;
    chargeInfosTimer: any;
    chargeInfosInterval: number;
    chargeInfoSeq: 0;
    qualityTimerInterval: number;
    maxRetryCount: number;
    previewVideoList: ZegoPreview[];
    signalList: {
        [index: string]: SignalInfo;
    };
    appid: number;
    userid: string;
    token: string;
    server: string;
    constructor(log: LoggerWeb, stateCenter: StateCenter);
    onSignalDisconnected(server: any): void;
    setQualityMonitorCycle(timeInMs: number): void;
    setSessionInfo(appid: number, userid: string, token: string, testEnvironment: boolean): void;
    onPlayStateUpdate(type: any, streamid: any, error: any): void;
    onPlayQualityUpdate(streamid: any, streamQuality: any): void;
    onPublishStateUpdate(type: any, streamid: any, error: any): void;
    onPublishQualityUpdate(streamid: any, streamQuality: any): void;
    onUpdateHeartBeartIntervalHandle(interval: number): void;
    switchDevice(type: 'audio' | 'video', localVideo: HTMLMediaElement, deviceId: string, success: Function, error: Function): void;
    enableMicrophone(localVideo: HTMLElement, enable: boolean): boolean;
    enableCamera(localVideo: HTMLElement, enable: boolean): boolean;
    startPreview(localVideo: HTMLElement, mediaStreamConstraints: MediaStreamConstraints, success: Function, error: Function): boolean;
    stopPreview(localVideo: HTMLElement): boolean;
    setPublishStateStart(streamid: any, localVideo: any, playOption: PlayOption): boolean;
    getTotalStreamId(streamid: any): any;
    startPublishingStream(streamid: string, serverUrls: string[], preferPublishSourceType?: number): boolean;
    updateWaitingList(signalInfo: SignalInfo, isPublish: boolean, streamId: string, success: Function, error: Function): void;
    publishStream(streamid: any): void;
    connectPublishServer(streamId: string, isForce?: boolean): boolean;
    shouldRetry(stream: {
        serverUrls: string[];
        retryCount: number;
    }, errorCode: number): boolean;
    getTokenSuccess(): void;
    stopPublishingStream(streamid: string): void;
    setPlayStreamAudioOutput(streamid: string, audioOutput: string): boolean;
    setStreamAudioOutput(localVideo: any, audioOutput: string): boolean;
    connetWithReuseSignalServer(streamId: string, isPublish: boolean, serverUrl: string, success: Function, error: Function, isForce?: boolean): void;
    setPlayStateStart(streamid: string, remoteVideo: HTMLElement, audioOutput: string, playOption: PlayOption): boolean;
    startPlayingStream(streamid: string, serverUrls: string[], currentPlaySourceType?: number): boolean;
    connectPlayServer(streamId: string, isForce?: boolean): boolean;
    private tryCountConnectInterval;
    private connetWithReuseSignalServerTimer;
    private playStream;
    private removeStreamFromSignal;
    private stopSignalHeartbeat;
    stopPlayingStream(streamid: any): void;
    reset(): void;
    checkMessageTimeout: () => void;
    getAllInUseUrl: () => any[];
    onDisconnectHandle: (server: any) => void;
    startSignalHeartbeat(): void;
    startChargeInfosUpload(): void;
    checkChargeInfos(): void;
    checkSignalHeartbeat(): void;
    checkPreview(localVideo: HTMLElement): ZegoPreview;
    removePreview(preview: ZegoPreview): void;
    onPlayerStreamUrlUpdate(streamid: string, url: string, type: string): void;
    onVideoSizeChanged(streamId: string, videoWidth: number, videoHeight: number): void;
    onRemoteCameraStatusUpdate(streamID: string, status: number): void;
    onRemoteMicStatusUpdate(streamID: string, status: number): void;
    setPublishStreamConstraints(streamID: string, constraints: MediaStreamConstraints, success: Function, error: Function): void;
}
