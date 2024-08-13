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
          } else if (i == 0) result = result * (-1);
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

const createBinary = (decimal) => {

  const getBss = () => {
    let binaryBss = '';
    let partial = 0;
    let copy = '';
    if (decimal[0] == '-') {
      for (let index = 1; index < decimal.length; index++) {
        copy += decimal[index];
      }
    } else {
      copy = decimal;
    }
    if (copy.length > 0) {
      let i = 0;

      while (partial < copy) {
        i++;
        partial = Math.pow(2, i);
      };

      if ((partial == copy) && (copy != '0')) {
        binaryBss += '1';
        for (i; i > 0; i--) {
          binaryBss += '0';
        };
      } else if (copy == '0') {
        binaryBss = '0';
      } else {
        let auxDecimal = Number(copy);
        let maxNumberToAdd = Math.pow(2, i - 1);
        while (i > 0) {
          if (maxNumberToAdd < auxDecimal) {
            binaryBss += '1';
            auxDecimal = auxDecimal - maxNumberToAdd;
            i--;
            maxNumberToAdd = Math.pow(2, i - 1);
          } else if (maxNumberToAdd == auxDecimal) {
            binaryBss += '1';
            i--;
            for (i; i > 0; i--) {
              binaryBss += '0';
            }
          } else {
            binaryBss += '0';
            i--;
            maxNumberToAdd = Math.pow(2, i - 1);
          }
        }
      }
    }

    return binaryBss;
  }

  if (decimal[0] != '-') console.log(getBss(), ' sin signo ', decimal);

  const getBcs = () => {
    let string = getBss();
    if ((decimal < 0) || decimal == '-0') {
      const lengthOfString = string.length + 1;
      string = string.padStart(lengthOfString, '1');
    }
    return string;
  }

  console.log(getBcs(), ' con signo ', decimal);

  const getCa1 = () => {
    let string = getBss();
    if (decimal[0] == '-') {
      string = string.padStart(string.length + 1, '0');
      let copy = '';
      for (let i = 0; i < string.length; i++) {
        if (string[i] == '1') copy += '0';
        else copy += '1';
      }
      return copy
    } else {
      return string
    }
  };

  console.log(getCa1(), ' Ca1 ', decimal);

  const getCa2 = () => {
    let string = getBss();

    if ((decimal[0] == '-') && (decimal < 0)) {
      let j = 1;
      string = string.padStart(string.length + 1, '0');
      let copy = '';
      let boolean = false;
      for (let i = string.length - 1; i >= 0; i--) {
        if ((!boolean) && (string[i] == '0')) {
          copy = copy.padStart(j, '0');
        } else if ((!boolean) && (string[i] == '1')) {
          copy = copy.padStart(j, '1');
          boolean = !boolean;
        } else if (boolean) {
          if (string[i] == '1') copy = copy.padStart(j, '0');
          else copy = copy.padStart(j, '1');
        }
        j++;
      };
      let number = Number(decimal) * (-1);
      if (number == Math.pow(2, string.length - 2)) copy = copy.slice(1, copy.length);
      return copy;
    } else {
      return string;
    }
  };

  console.log(getCa2(), ' en ca2 ', decimal);
};

createBinary('40');
createBinary('16');
createBinary('41');
createBinary('-41');
createBinary('42');
createBinary('-42');
createBinary('-127');
createBinary('-128');

const getHexa = (binary) => {
  const hexa = {
    '0000': '0',
    '0001': '1',
    '0010': '2',
    '0011': '3',
    '0100': '4',
    '0101': '5',
    '0110': '6',
    '0111': '7',
    '1000': '8',
    '1001': '9',
    '1010': 'A',
    '1011': 'B',
    '1100': 'C',
    '1101': 'D',
    '1110': 'E',
    '1111': 'F'
  };

  let result = '';

  const rest = binary.length % 4;

  if (rest == 0) {
    const roundsOfFor = binary.length / 4;

    for (let i = 1; i <= roundsOfFor; i++) {
      const cuttedChain = binary.slice(0, 4);
      result += hexa[cuttedChain];
      binary = binary.slice(4);
    };
  } else {
    const finalLength = binary.length + (4 - rest);

    binary = binary.padStart(finalLength, '0');

    const roundsOfFor = binary.length / 4;

    for (let i = 1; i <= roundsOfFor; i++) {
      const cuttedChain = binary.slice(0, 4);
      result += hexa[cuttedChain];
      binary = binary.slice(4);
    };
  };

  return result;
};


console.log(getHexa('1010101010010011'))
console.log(getHexa('0011111'))

const convertHexa = (hexa) => {
  const binary = {
    '0': '0000',
    '1': '0001',
    '2': '0010',
    '3': '0011',
    '4': '0100',
    '5': '0101',
    '6': '0110',
    '7': '0111',
    '8': '1000',
    '9': '1001',
    'A': '1010',
    'B': '1011',
    'C': '1100',
    'D': '1101',
    'E': '1110',
    'F': '1111'
  };

  let result = '';

  for (let i = 0; i < hexa.length; i++) {
    result += binary[hexa[i]];
  }

  return result;
}

console.log(convertHexa('AA'))

console.log(convertHexa('2B1'))

const BCDempSS = (number) => {
  const chain = number.toString();

  const numbers = {
    '0': '0000',
    '1': '0001',
    '2': '0010',
    '3': '0011',
    '4': '0100',
    '5': '0101',
    '6': '0110',
    '7': '0111',
    '8': '1000',
    '9': '1001'
  };

  let result = '';

  for (let i = 0; i < chain.length; i++) {
    result += numbers[chain[i]];
  };

  return result;
};

console.log(BCDempSS(89))
console.log(BCDempSS(14))

const BCDempCS = (chain) => {
  const numbers = {
    '0': '0000',
    '1': '0001',
    '2': '0010',
    '3': '0011',
    '4': '0100',
    '5': '0101',
    '6': '0110',
    '7': '0111',
    '8': '1000',
    '9': '1001'
  };

  let result = '';

  for (let i = 1; i < chain.length; i++) {
    result += numbers[chain[i]];
  };

  if (chain[0] == '-') result += '1101';
  else result += '1100';

  return result;
};

console.log(BCDempCS('-59'));
console.log(BCDempCS('+59'));

const BCDdesSS = (number) => {
  const chain = number.toString();

  const numbers = {
    '0': '0000',
    '1': '0001',
    '2': '0010',
    '3': '0011',
    '4': '0100',
    '5': '0101',
    '6': '0110',
    '7': '0111',
    '8': '1000',
    '9': '1001'
  };

  let result = '';

  for (let i = 0; i < chain.length; i++) {
    result += `1111${numbers[chain[i]]}`;
  };

  return result;
}

console.log(BCDdesSS(89));

const BCDdesCS = (number) => {

  let chain = number.toString();

  chain = chain.slice(1);

  const numbers = {
    '0': '0000',
    '1': '0001',
    '2': '0010',
    '3': '0011',
    '4': '0100',
    '5': '0101',
    '6': '0110',
    '7': '0111',
    '8': '1000',
    '9': '1001'
  };

  let result = '';

  for (let i = 0; i < chain.length; i++) {
    if (i < chain.length - 1) {
      result += `1111${numbers[chain[i]]}`;
    } else {
      if (number < 0) result += `1101${numbers[chain[i]]}`;
      else result += `1100${numbers[chain[i]]}`;
    };
  };

  return result;
};

console.log(BCDdesCS('-89'), ' bcd des cs');
console.log(BCDdesCS('+89'), ' bcd des cs');