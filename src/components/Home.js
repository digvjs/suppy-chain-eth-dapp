import React from 'react'
import * as THREE from 'three'
import GLOBE from 'vanta/dist/vanta.globe.min'

class Home extends React.Component {
  
  constructor() {
    super()
  }

  render() {
    return (
      <React.Fragment>
        <div className="globe-bg-overlay"></div>
        <div className="globe-background"></div>
      </React.Fragment>
    )
  }

  componentDidMount() {
    this.vantaEffect = GLOBE({
        el: '.globe-background',
        THREE: THREE // use a custom THREE when initializing
    })
  }

  componentWillUnmount() {
    if (this.vantaEffect) this.vantaEffect.destroy()
  }

}

export default Home;