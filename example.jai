#load "module.jai";

main :: () {
    N :: 1_000_000;
    test_data := NewArray(N, int, false);
    for *test_data {
        <<it = it_index;
    }

    print("parallel_for\n");

    proc :: (x: *int, ix: int) {
        <<x *= <<x;
    }

    // parallel_for(test_data, (x, ix) => {
    //     <<x = <<x * <<x;
    // }, logging=true);

    parallel_for(test_data, proc, logging=true);

    for 0..100 {
        print("%: %\n", it, test_data[it]);
    }

    // print("parallel_for_chunked\n");
    // parallel_for_chunked(test_data, 100, (x, ix) => {
    //     <<x = <<x/2 - ix;  
    // }, logging=false);

    // for 0..100 {
    //     print("%: %\n", it, test_data[it]);
    // }


    // global : struct{offset: int = 2;};

    // print("parallel_for global\n");
    // parallel_for(test_data, *global, (x,ix,g) => {
    //     <<x += g.offset * ix;    
    // });

    // for 0..100 {
    //     print("%: %\n", it, test_data[it]);
    // }

    // print("parallel_for_chunked global\n");
    // parallel_for_chunked(test_data, *global, 100, (x,ix,g) => {
    //     <<x += 10 * g.offset * ix;    
    // });

    // for 0..100 {
    //     print("%: %\n", it, test_data[it]);
    // }
}