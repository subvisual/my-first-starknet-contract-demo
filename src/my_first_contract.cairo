#[starknet::interface]
trait IMyFirstContract<ContractState> {
    fn get_value(self: @ContractState) -> u64;
    fn set_value(ref self: ContractState, new_value: u64);
}

#[starknet::contract]
mod MyFirstContract {
    #[storage]
    struct Storage {
        value: u64
    }

    #[constructor]
    fn constructor(ref self: ContractState) {
        self.value.write(1)
    }

    #[external(v0)]
    impl MyFirstContract of super::IMyFirstContract<ContractState> {
        fn get_value(self: @ContractState) -> u64 {
            self.value.read()
        }

        fn set_value(ref self: ContractState, new_value: u64) {
            self.value.write(new_value)
        }
    }
}
