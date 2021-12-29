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
    parallel_for(test_data, proc);

    parallel_for(test_data, x => {
        <<x *= 2;
    });

    for 0..100 {
        print("%: %\n", it, test_data[it]);
    }

    print("parallel_for_chunked\n");
    parallel_for_chunked(test_data, 100, x => {
        <<x = <<x/2;  
    });

    for 0..100 {
        print("%: %\n", it, test_data[it]);
    }


    global : struct{offset: int = 2;};

    print("parallel_for global\n");
    parallel_for(test_data, *global, (x,g) => {
        <<x += g.offset;    
    });

    for 0..100 {
        print("%: %\n", it, test_data[it]);
    }

    print("parallel_for_chunked global\n");
    parallel_for_chunked(test_data, *global, 100, (x,g) => {
        <<x += 10 * g.offset;   
    }, logging=true);

    for 0..100 {
        print("%: %\n", it, test_data[it]);
    }
}