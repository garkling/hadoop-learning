import sys
from operator import add

from pyspark import SparkContext

if __name__ == '__main__':
    try:
        _, input_file, output_file = sys.argv
    except ValueError:
        print("Usage: spark-submit word_count.py <input-file> <output-file>", file=sys.stderr)
        exit(1)

    sc = SparkContext(appName='WordCount')

    lines = sc.textFile(input_file, minPartitions=1)
    lines.sortByKey()
    count = (lines
             .flatMap(lambda line: line.split())
             .map(lambda w: (w, 1))
             .reduceByKey(add)
             )

    count.saveAsTextFile(output_file)
