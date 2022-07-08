#include <M5Atom.h>
#include <Arduino.h>
#include <WiFi.h>
#include <WiFiMulti.h>
#include <HTTPClient.h>

WiFiMulti wifiMulti;
HTTPClient http;

void setup() {
  M5.begin();
  wifiMulti.addAP("D'Avila Mesquita", "peroladiamante");
  wifiMulti.addAP("deco X20", "amarelinho");
  Serial.print("\nConnecting Wifi...\n");
  while(!(wifiMulti.run() == WL_CONNECTED)) Serial.println(".");
  M5.update();
}

void loop() {
  M5.update();

  if (M5.Btn.wasReleased()) {
      Serial.print("valor: ");
      String v = lerRegistro("wvgY8Pi4R4xUng1ugC9Uy5Xy", "contagem");
      Serial.println(v);
      Serial.print(".toInt: ");
      Serial.println(v.toInt());
      Serial.print(".toFloat: ");
      Serial.println(v.toFloat());
      Serial.println(escreverRegistro("wvgY8Pi4R4xUng1ugC9Uy5Xy", "outro texto", "edson"));
  }
}

String lerRegistro(String token, String nome) {
  String valor = "";
  String url = "http://idcparatodos.com.br/redes/";
  url += token;
  url += "/registros/";
  url += nome;
  http.begin(url);
  int httpCode = http.GET();
  if (httpCode > 0) {
    if (httpCode == HTTP_CODE_OK) {
      String payload = http.getString();
      valor = payload;
    }
  }
  http.end();
  return valor;
}

boolean escreverRegistro(String token, String nome, String valor) {
  boolean sucesso = false;
  String url = "http://idcparatodos.com.br/redes/";
  url += token;
  url += "/registros/";
  url += nome;
  url += "/";
  url += valor;
  http.begin(url);
  int httpCode = http.GET();
  if (httpCode > 0) {
    if (httpCode == HTTP_CODE_OK) {
      String payload = http.getString();
      if(payload == "OK") sucesso = true;
    }
  }
  http.end();
  return sucesso;
}
