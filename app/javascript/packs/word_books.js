$(document).on('turbolinks:load', function() {
  speechSynthesis.getVoices()
  speak = function(text) {
    // インスタンス作成
    var wordinfo = new SpeechSynthesisUtterance(text)

    // 音声データの取得
    var voice = speechSynthesis.getVoices().find(function(voice){
      return voice.name === 'Google US English'
    })

    // 音声の設定
    if(voice){
      wordinfo.voice = voice
      wordinfo.volume = 1.0
      wordinfo.rate = 0.8
      wordinfo.lang = "en-US"
      wordinfo.pitch = 1.0
    }

    // 音声の再生
    speechSynthesis.speak(wordinfo)
  }
})


