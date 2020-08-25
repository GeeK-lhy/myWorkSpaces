import { PlayOption, ENUM_BROADCASTER_STATUS } from '../common/zego.entity';
import { ZegoDataReport } from '../common/zego.datareport';
import { ZegoSignal } from '../common/zego.signal';
import { Logger } from '../common/zego.logger';
import { ZegoStreamCenterWeb } from './zego.streamCenter.web';
export declare class ZegoPlayWeb {
    logger: Logger;
    signal: ZegoSignal;
    state: number;
    streamCenter: ZegoStreamCenterWeb;
    candidateInfo: any[];
    waitICETimer: any;
    waitingICETimeInterval: number;
    waitingOfferTimer: any;
    waitingOfferTimeInterval: number;
    waitingServerTimer: any;
    waitingServerTimerInterval: number;
    qualityTimer: any;
    qualityTimeInterval: number;
    playQualityList: any[];
    maxQualityListCount: number;
    lastPlayStats: {
        audioPacketsLost: number;
        videoPacketsLost: number;
        time: number;
        audioTime: number;
        videoTime: number;
        audioBytesReceived: number;
        videoBytesReceived: number;
        framesDecoded: number;
        framesReceived: number;
        framesDropped: number;
        audioBitrate: number;
    };
    dataReport: ZegoDataReport;
    reportSeq: number;
    videoSizeCallback: boolean;
    qualityUpload: boolean;
    qualityUploadInterval: number;
    qualityUploadLastTime: number;
    maxRetryCount: number;
    currentRetryCount: number;
    retryState: number;
    remoteVideo: any;
    remoteStream: MediaStream;
    streamId: string;
    audioOutput: any;
    sessionId: number;
    sessionSeq: number;
    answerSeq: number;
    audioOputput: any;
    peerConnection: RTCPeerConnection | any;
    playOption: PlayOption;
    closeSessionSignal: boolean;
    stateNego: number;
    negoTimer: any;
    negoInterval: number;
    negoTryCount: number;
    negoTryMaxCount: number;
    broadcasterStatus: ENUM_BROADCASTER_STATUS;
    cameraStatus: any;
    micStatus: any;
    playEvent: boolean;
    nextSignalTryCount: number;
    waittingConnectedTimer: any;
    waittingConnectedInerval: number;
    constructor(log: Logger, signal: ZegoSignal, dataReport: ZegoDataReport, qualityTimeInterval: number, streamCenter: ZegoStreamCenterWeb);
    setAudioDestination(audioOutput: string): boolean;
    startPlay(streamId: string, remoteVideo: HTMLElement, audioOutput?: string, playOption?: PlayOption): void;
    private onCreatePlaySessionSuccess;
    onCreateOfferSuccess(desc: {
        sdp: any;
    }): void;
    private onSetLocalDescriptionSuccess;
    private onRecvMediaDesc;
    private onRecvCandidateInfo;
    private onRecvPlayEvent;
    private onIceCandidate;
    private onConnectionStateChange;
    private onIceConnectionStateChange;
    private checkPlayConnectionFailedState;
    private shouldRetryPlay;
    private startRetryPlay;
    private clearTryPlayTimer;
    private tryStartPlay;
    private clearPlayQualityTimer;
    private resetPlay;
    private setPlayQualityTimer;
    private getPlayStats;
    private getNetQuality;
    private uploadPlayQuality;
    private onRecvResetSession;
    private onRecvCloseSession;
    private onRecvStreamStatus;
    private onGotRemoteStream;
    private sendCandidateInfo;
    private shouldSendCloseSession;
    private playStateUpdateError;
    onPlayStateUpdate(type: any, streamId: any, error?: any): void;
    onPlayQualityUpdate(streamId: any, quality: any): void;
    onVideoSizeChanged(streamId: any, videoWidth: any, videoHeight: any): void;
    onRemoteCameraStatusUpdate(streamID: string, status: number): void;
    onRemoteMicStatusUpdate(streamID: string, status: number): void;
    stopPlay(): void;
    onDisconnect(): void;
    tryNextSignal(error: any): void;
}
