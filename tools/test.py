import unittest
import calabar


class TestModuleMethods(unittest.TestCase):
    def test_step1_init(self):
        calabar.cleanup('C:\\Users\\danris\\Documents\\Projects\\Terraform\\terraforge-example\\test\\standard_vpc\\')

        self.assertEqual(
            calabar.init('C:\\Users\\danris\\Documents\\Projects\\Terraform\\terraforge-example\\test\\standard_vpc\\'),
            0
        )

    def test_step2_plan(self):
        self.assertEqual(
            calabar.plan('C:\\Users\\danris\\Documents\\Projects\\Terraform\\terraforge-example\\test\\standard_vpc\\'),
            2
        )

    def test_step3_apply(self):
        self.assertEqual(
            calabar.apply('C:\\Users\\danris\\Documents\\Projects\\Terraform\\terraforge-example\\test\\standard_vpc\\'),
            0
        )

    def test_step4_plan(self):
        self.assertEqual(
            calabar.plan('C:\\Users\\danris\\Documents\\Projects\\Terraform\\terraforge-example\\test\\standard_vpc\\'),
            0
        )

    def test_step5_plan_destroy(self):
        self.assertEqual(
            calabar.plan_destroy('C:\\Users\\danris\\Documents\\Projects\\Terraform\\terraforge-example\\test\\standard_vpc\\'),
            2
        )

    def test_step6_apply_destroy(self):
        self.assertEqual(
            calabar.apply_destroy('C:\\Users\\danris\\Documents\\Projects\\Terraform\\terraforge-example\\test\\standard_vpc\\'),
            0
        )

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(TestModuleMethods)
    unittest.TextTestRunner(verbosity=2).run(suite)
