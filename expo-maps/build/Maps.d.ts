import React from 'react';
import { ExpoMapViewProps, MarkerProps } from './Maps.types';
export * from './Maps.types';
export declare class ExpoMap extends React.Component<ExpoMapViewProps> {
    private mapChildren;
    render(): JSX.Element;
}
export declare class Marker extends React.Component<MarkerProps> {
    render(): null;
}
