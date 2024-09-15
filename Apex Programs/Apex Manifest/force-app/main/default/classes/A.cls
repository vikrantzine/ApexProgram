public class A {
    Integer val1, val2, val3;
    
    public A(Integer val1, Integer val2, Integer val3) {
        this.val1 = val1;
        this.val2 = val2;
        this.val3 = val3;
    }

    public void method() {
        System.debug('Value='+val1+','+val2+','+val3);
    }
}