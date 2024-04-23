const getBinary = (string, system) => {
  let result = 0;
  if (system == 'bss') {

    if (string.length > 0) {
      const exponent = string.length - 1;
      const maxNumber = Math.pow(2, string.length) - 1;

      for (let i = exponent; i >= 0; i--) {

        if (string[i] == '1') {
          result = result + (Math.pow(2, exponent - i));
        }

      }

      console.log(`Maximo numero representable ${maxNumber} y el numero interpretado es ${result}`);
    } else {
      console.log('Para interpretar numeros en binario sin signo, debe enviar al menos un bit');
    }

  } else if (system == 'bcs') {

    if (string.length >= 2) {
      const exponent = string.length - 1;
      const maxNumber = Math.pow(2, exponent) - 1;
      const lastBit = string[0];

      for (let i = exponent; i >= 1; i--) {

        if (string[i] == '1') {
          result = result + (Math.pow(2, exponent - i));
        };
      }

      if (lastBit == '1') result = result * (-1);

      if ((result == 0) && (lastBit == '1')) console.log(`El maximo numero representable es ${maxNumber} y el numero interpretado es -${result}`);
      else console.log(`El maximo numero representable es ${maxNumber} y el numero interpretado es ${result}`);
    } else {
      console.log('En binario con signo no se puede operar con menos de 2 bits');
    }

  } else if (system == 'ca1') {
    if (string.length >= 2) {
      const exponent = string.length - 1;
      const maxNumber = Math.pow(2, exponent) - 1;
      const lastBit = string[0];

      for (let i = exponent; i >= 0; i--) {
        if (lastBit == '1') {
          if (i > 0) {
            if (string[i] == '0') {
              result = result + Math.pow(2, exponent - i);
            }
          }
          if (i == 0) result = result * (-1);
        } else {
          if ((string[i] == '1') && (i > 0)) {
            result = result + (Math.pow(2, exponent - i))
          }
        }
      };
      if ((result == 0) && (lastBit == '1')) console.log(`El maximo numero representable es ${maxNumber} y el numero interpretado es -${result}`);
      else console.log(`El maximo numero representable es ${maxNumber} y el numero interpretado es ${result}`);
    };
  } else if (system == 'ca2') {
    if (string.length >= 2) {
      const exponent = string.length - 1;
      const maxNumber = Math.pow(2, exponent) - 1;
      const lastBit = string[0];

      let boolean = false;
      for (let i = exponent; i >= 0; i--) {
        if (lastBit == '1') {
          if (i >= 0) {
            if ((boolean) && (string[i] == '0')) result = result + Math.pow(2, exponent - i);
            else if ((!boolean) && (string[i] == '1')) {
              boolean = !boolean;
              result = result + Math.pow(2, exponent - i);
            }
          }
          if (i == 0) result = result * (-1);
        } else {
          if ((string[i] == '1') && (i > 0)) {
            result = result + (Math.pow(2, exponent - i))
          }
        }
      };
      if (lastBit == '1') {
        console.log(`El maximo numero representable es ${maxNumber} y el numero interpretado es ${result}`);
      } else console.log(`El maximo numero representable es ${maxNumber} y el numero interpretado es ${result}`);
    };
  } else if (system == 'exc') {

    if (string.length > 1) {
      const exponent = string.length - 1;
      const maxNumber = Math.pow(2, string.length - 1) - 1;
      const excToSub = Math.pow(2, exponent);

      for (let i = exponent; i >= 0; i--) {

        if (string[i] == '1') {
          result = result + (Math.pow(2, exponent - i));
        }

      }

      result = result - excToSub;
      console.log(`Maximo numero representable ${maxNumber} y el numero interpretado es ${result}`);
    } else {
      console.log('Para interpretar numeros en binario sin signo, debe enviar al menos dos bits');
    }
  }
};

getBinary('00000000', 'bss');
getBinary('10000000', 'bcs');
getBinary('10000000', 'ca1');
getBinary('10000010', 'ca2');
getBinary('00000000', 'exc');