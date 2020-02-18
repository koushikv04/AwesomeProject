/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React from 'react';
import {
  Button,
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  NativeModules,
  Alert,
  FlatList
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';


export default class App extends React.Component {

  constructor (props) {
    super(props);
    this.state = {
      weatherText : {name:""}
    }
  }
  getWeatherData = () => {
    var AwesomeProject = NativeModules.AwesomeProject;
    AwesomeProject.fetchWeatherData((weatherInfo)=> {
      if(weatherInfo){
        var info = weatherInfo.main;
        var sys = weatherInfo.sys;
        var desc = weatherInfo.weather[0];
        info.id = weatherInfo.id.toString();
        info.desc = desc.description;
        info.name = weatherInfo.name;
        info.country = sys.country;
        info.wind = weatherInfo.wind.toString();
      this.setState({weatherText:info});
    }
    else {
      Alert.alert("Unable to fetch data. Please try again later");
    }
      });
  }
  render() {
      return (
        <>
        <SafeAreaView>
          <Button title="FetchWeather" onPress={()=>{this.getWeatherData()}}/>
          <FlatList
            data={[this.state.weatherText]}
            renderItem={({item})=>
              <View style={styles.sectionContainer}>
                <Text style={styles.sectionTitle}> {item.name},{item.country}</Text>
                <Text style={styles.sectionDescription}> {item.desc}</Text>
                <Text style={styles.content}>Temperature:{item.temp}deg</Text>
                <Text style={styles.content}>Pressure:{item.pressure}</Text>
                <Text style={styles.content}>Feels like:{item.feels_like}deg</Text>
                <Text style={styles.content}>Temperature Max:{item.temp_max}deg</Text>
                <Text style={styles.content}>Temperaure Min:{item.temp_min}deg</Text>

              </View>
              }
              keyExtractor={item=>item.id}
            />
        </SafeAreaView>
        </>
        );
  }
}

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 50,
    fontWeight: '600',
    color: Colors.black,
    textAlign: 'center'
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 38,
    fontWeight: '400',
    color: Colors.dark,
    textAlign: 'center'
  },
  content : {
    marginTop: 10,
    fontSize:20,
    fontWeight: '900'
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});
