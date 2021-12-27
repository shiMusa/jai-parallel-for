#load "module.jai";

main :: () {
    N :: 1_000_000;
    test_data := NewArray(N, int, false);
    for *test_data {
        <<it = it_index;
    }

    parallel_for(test_data, x => {
        <<x = <<x * <<x;
    }, logging=true);

    for 0..100 {
        print("%: %\n", it, test_data[it]);
    }

    parallel_for_chunked(test_data, 100, x => {
        <<x = <<x/2;  
    }, logging=false);

    for 0..100 {
        print("%: %\n", it, test_data[it]);
    }


    global : struct{offset: int = 2;};

    parallel_for(test_data, *global, (x,g) => {
        <<x += g.offset;    
    });

    for 0..100 {
        print("%: %\n", it, test_data[it]);
    }

    parallel_for_chunked(test_data, *global, 100, (x,g) => {
        <<x += 10 * g.offset;    
    });

    for 0..100 {
        print("%: %\n", it, test_data[it]);
    }
}