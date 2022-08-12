import React from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    Image
} from 'react-native';

const MovieDetail = ({ originalTitle, overview, posterPath }) => (
    <View style={styles.container}>
        <Text style={styles.title}>I'm React Native Screen</Text>
        <Text style={styles.title}>{originalTitle}</Text>
        <Image style={styles.image} source={{ uri: `https://image.tmdb.org/t/p/w500${posterPath}` }} />
        <Text style={styles.subTitle}>Overview:</Text>
        <Text style={styles.text}>{overview}</Text>
    </View>
);

const styles = StyleSheet.create({
    container: {
        flex: 1,
        paddingTop: 100,
        paddingLeft: 20,
        paddingRight: 20,
        alignItems: 'center',
        backgroundColor: '#FFFFFF'
    },
    title: {
        textAlign: 'center',
        fontSize: 20,
        color: '#333333',
        marginBottom: 20
    },
    subTitle: {
        textAlign: 'left',
        fontSize: 15,
        fontWeight: 'bold',
        color: '#333333',
        marginBottom: 10,
        marginTop: 10,
    },
    text: {
        padding: 15,
    },
    image: {
        width: 250,
        height: 400
    }
});

AppRegistry.registerComponent('RNMovieDetail', () => MovieDetail);