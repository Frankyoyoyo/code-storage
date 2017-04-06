#include <dht11.h>
#define DHT11PIN 5

dht11 DHT11;     //定义对象
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial.println("DHT LIBIRARY VERSION: ");
  Serial.println(DHT11LIB_VERSION);

}

void loop(){
  Serial.println('\n');

  int chk = DHT11.read(DHT11PIN);
  Serial.print(chk);
  Serial.print("Read sensor: ");

switch(chk){
    case DHTLIB_OK: 
        Serial.println("OK");
        break;
    case DHTLIB_ERROR_CHECKSUM:
        Serial.println("Checksum error");
        break;
    case DHTLIB_ERROR_TIMEOUT:
        Serial.println("Timeout error");
        break;
    default:
        Serial.println("Unknown error");
        break;
  }

  Serial.print("Humidity(%): ");
  Serial.println(DHT11.humidity);
  Serial.print("Temperature(oC): ");
  Serial.println(DHT11.temperature);

  delay(1000);
}

