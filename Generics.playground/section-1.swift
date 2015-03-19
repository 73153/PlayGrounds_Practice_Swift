// Playground - noun: a place where people can play

import Cocoa

// Generics in Swift are similar to other languages. To create a generic function or type,
// simply enter the new type name inside angled brackets. It's very easy to make a generic
// function. The function below returns an array of the generic type, with the element
// repeated X times.
func populate<SomeType>(type: SomeType, total: Int) -> SomeType[] {
    var result = SomeType[]();
    for i in 0..total {
        result += type;
    }
    return result;
}
populate("string", 5);
populate(10, 5);

// You can also create generic forms of classes, structs and enumerations.
enum GenericValue<T> {
    case Value(T)
}
var possibleInteger: GenericValue<Int> = .Value(500);

// You can use the keyword where to specify a list of requirements for your generic. The
// Apple example for this is to check that the two arguments are Equatable, and that they
// are of the same type:
func anyCommonElements <T, U where T: Sequence, U: Sequence, T.GeneratorType.Element: Equatable, T.GeneratorType.Element == U.GeneratorType.Element> (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true;
            }
        }
    }
    return false;
}
anyCommonElements([1, 2, 3], [3]);

// Here is an example of the above using purely an Equatable check, to compare two generic
// arrays in an attempt to figure out a list of any common elements between the passed in 
// arrays.
func anyCommonElements <T: Equatable> (lhs: T[], rhs: T[]) -> T[] {
    var common = T[]();
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                common += lhsItem;
            }
        }
    }
    return common;
}

anyCommonElements([1, 2, 3, 4, 5], [1, 3, 5]);