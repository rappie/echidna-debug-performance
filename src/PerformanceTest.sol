// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract WithFallback {
    // fallback() external payable virtual {}
}

contract PerformanceTest {
    A a;

    mapping(address => uint256) internal MAPPING;

    constructor() {
        a = new A();
    }

    function test() public {
        // MAPPING[address(0)] = 123;
        uint256 result = a.a();
    }
}

contract A {
    B b = new B();

    function a() public view returns (uint256) {
        // return 1;
        return b.a();
    }
}

contract B {
    C c = new C();

    function a() public view returns (uint256) {
        return c.a();
    }
}

contract C {
    D d = new D();

    function a() public view returns (uint256) {
        return d.a();
    }
}

contract D {
    E e = new E();

    function a() public view returns (uint256) {
        return e.a();
    }
}

contract E {
    F f = new F();

    function a() public view returns (uint256) {
        return f.a();
    }
}

contract F {
    function a() public view returns (uint256) {
        return 1;
    }
}
