//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

interface IERC20 {
    function totalSupply() external view returns (uint256);

    function symbol() external view returns (string memory);

    function name() external view returns (string memory);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Returns the number of decimal places
     */
    function decimals() external view returns (uint8);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);

    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    )
        external
        payable
        returns (uint amountToken, uint amountETH, uint liquidity);

    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);

    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);

    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint amountA, uint amountB);

    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint amountToken, uint amountETH);

    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapExactETHForTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts);

    function swapTokensForExactETH(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapExactTokensForETH(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);

    function swapETHForExactTokens(
        uint amountOut,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable returns (uint[] memory amounts);

    function quote(
        uint amountA,
        uint reserveA,
        uint reserveB
    ) external pure returns (uint amountB);

    function getAmountOut(
        uint amountIn,
        uint reserveIn,
        uint reserveOut
    ) external pure returns (uint amountOut);

    function getAmountIn(
        uint amountOut,
        uint reserveIn,
        uint reserveOut
    ) external pure returns (uint amountIn);

    function getAmountsOut(
        uint amountIn,
        address[] calldata path
    ) external view returns (uint[] memory amounts);

    function getAmountsIn(
        uint amountOut,
        address[] calldata path
    ) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);

    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;

    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;

    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

interface IUniswapV2Factory {
    event PairCreated(
        address indexed token0,
        address indexed token1,
        address pair,
        uint
    );

    function feeTo() external view returns (address);

    function feeToSetter() external view returns (address);

    function getPair(
        address tokenA,
        address tokenB
    ) external view returns (address pair);

    function allPairs(uint) external view returns (address pair);

    function allPairsLength() external view returns (uint);

    function createPair(
        address tokenA,
        address tokenB
    ) external returns (address pair);

    function setFeeTo(address) external;

    function setFeeToSetter(address) external;
}

contract Ownable {
    address private owner;

    // event for EVM logging
    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    // modifier to check if caller is owner
    modifier onlyOwner() {
        // If the first argument of 'require' evaluates to 'false', execution terminates and all
        // changes to the state and to Ether balances are reverted.
        require(msg.sender == owner, "Caller Is Not Owner");
        _;
    }

    /**
     * @dev Set contract deployer as owner
     */
    constructor() {
        owner = msg.sender; // 'msg.sender' is sender of current call, contract deployer for a constructor
        emit OwnerSet(address(0), owner);
    }

    // Change owner address
    function changeOwner(address newOwner) public onlyOwner {
        require(newOwner != address(0),"Zero Address Cannot Be The Owner");
        emit OwnerSet(owner, newOwner);
        owner = newOwner;
    }

    // Return owner address
    function getOwner() external view returns (address) {
        return owner;
    }
}

abstract contract ReentrancyGuard {
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;
    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    modifier nonReentrant() {
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
        _status = _ENTERED;
        _;
        _status = _NOT_ENTERED;
    }
}

// helper methods for interacting with ERC20 tokens and sending ETH that do not consistently return true/false
library TransferHelper {
    function safeApprove(address token, address to, uint value) internal {
        // bytes4(keccak256(bytes('approve(address,uint256)')));
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(0x095ea7b3, to, value)
        );
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            "TransferHelper: APPROVE_FAILED"
        );
    }

    function safeTransfer(address token, address to, uint value) internal {
        // bytes4(keccak256(bytes('transfer(address,uint256)')));
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(0xa9059cbb, to, value)
        );
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            "TransferHelper: TRANSFER_FAILED"
        );
    }

    function safeTransferFrom(
        address token,
        address from,
        address to,
        uint value
    ) internal {
        // bytes4(keccak256(bytes('transferFrom(address,address,uint256)')));
        (bool success, bytes memory data) = token.call(
            abi.encodeWithSelector(0x23b872dd, from, to, value)
        );
        require(
            success && (data.length == 0 || abi.decode(data, (bool))),
            "TransferHelper: TRANSFER_FROM_FAILED"
        );
    }

    function safeTransferETH(address to, uint value) internal {
        (bool success, ) = to.call{value: value}(new bytes(0));
        require(success, "TransferHelper: ETH_TRANSFER_FAILED");
    }
}

/**
    Stake EverGrow
 */
contract EverGrowStaking is Ownable, ReentrancyGuard {
    // Staking Token
    address public immutable token;

    // ERC20 Stuff
    string public constant name = "Staked EverGrow";
    string public constant symbol = "SEGC";
    uint8 public immutable decimals;

    // Precision for token decimal accuracy
    uint256 private constant PRECISION = 10 ** 18;

    // Lock Time
    uint256 public entryFee; // out of 1,000 -> 0.1% fee precision
    uint256 public exitFee; // out of 1,000 -> 0.1% fee precision
    uint256 private constant fee_denom = 1_000;
    address public feeRecipient;

    // Staking Amount
    uint256 public totalStaked;
    // max staking per batch in tokens (not wei) = 1 trillion
    uint256 public maxStakingPerBatch = 1_000_000_000_000;
    // small wei fee in tokens to jumpstart total rewards
    uint256 public smallFeeToBoostTotalExcluded = 1_000_000; // (wei)

    // admin array
    mapping(address => bool) public admins;
    bool public safeMode = true;

    modifier onlyAdmin() {
        require(
            admins[msg.sender] || this.getOwner() == msg.sender,
            "Only Admin"
        );
        _;
    }

    // User Info
    struct UserInfo {
        uint256 amount;
        uint256 joinTime;
    }
    mapping(address => UserInfo) public userInfo;

    // Packages Info
    struct RewardPackage {
        address rewardToken; // token thats being distributed
        uint256 totalToDistribute; // total number of tokens to distribute over time period
        uint256 totalDistributed; // total number of tokens already distributed
        uint256 tokensPerSecond; // number of tokens to distribute to the pool per second
        uint256 timePeriod; // length of time in seconds that this package is distributing rewards
        uint256 endTime; // time when this package ends
        uint256 startTime; // time whent this package started
        uint256 totalClaimed; // total number of tokens claimed from this package
        uint256 dividendsPerShare; // number of tokens receivable for each share of the contract
        uint256 lastUpdate; // last time dividendsPerShare was updated
        bool hasEnded; // true if package has ended
        address[] swapPath; // swap path between rewardToken and token
        address DEX; // Exchange to swap for token
        mapping(address => uint256) totalExcluded; // maps an address to the dividendsPerShare value last claimed
        uint256 slippageTolerance;
    }

    // nonce tracking the package number
    uint256 public packageNonce;

    //count of active packages
    uint8 public activePackageCount = 0;

    // starting index for package looping
    uint256 public startIndex = 0;

    // total number of unique stakers
    uint256 public totalStakers;

    // Maps a package nonce to a package with info
    mapping(uint256 => RewardPackage) private packages;

    // events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event AdminSet(address indexed admin, bool status);
    event PackageAdded(
        uint256 indexed packageId,
        address indexed rewardToken,
        uint256 totalToDistribute,
        uint256 timePeriod,
        address[] swapPath,
        address DEX
    );
    event PackageAltered(
        uint256 indexed packageId,
        address indexed rewardToken,
        uint256 totalToDistribute,
        uint256 timePeriod,
        address[] swapPath,
        address DEX
    );
    event PackageEnded(uint256 indexed packageId);
    event Claimed(address indexed user, uint256 amount);
    event Compounded(address indexed user, uint256 amount);
    event SafeModeSet(bool currentSafeMode);

    event OwnerWithdraw(
        address indexed token,
        address indexed to,
        uint256 amount
    );

    constructor(address _token, uint256 _exitFee, address _feeRecipient) {
        require(_token != address(0), "Zero Address");
        require(_feeRecipient != address(0), "Zero Address");
        token = _token;
        decimals = IERC20(_token).decimals();

        exitFee = _exitFee;
        feeRecipient = _feeRecipient;
        // make owner an admin
        admins[msg.sender] = true;
    }

    modifier onlyEOA() {
        require(isContract(msg.sender) == false && (msg.sender == tx.origin) , "No Smart Contract Calls Allowed");
        _;
    }

    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    /////////////////////////////////////////////////
    /////////       OWNER FUNCTIONS         /////////
    /////////////////////////////////////////////////

    function addAdmin(address admin) external onlyOwner {
        admins[admin] = true;
        emit AdminSet(admin, true);
    }

    function removeAdmin(address admin) external onlyOwner {
        admins[admin] = false;
        emit AdminSet(admin, false);
    }

    function setMaxStakingPerBatch(uint256 newMax) external onlyOwner {
        require(newMax > 0, "Zero Amount");
        require(newMax <= 1_000_000_000_000, "Max Limit Exceeded");
        maxStakingPerBatch = newMax;
    }

    // Specifically for protecting users from accidents
    function setSafeMode(bool newSafeMode) external onlyAdmin {
        safeMode = newSafeMode;
        emit SafeModeSet(newSafeMode);
    }

    function setSmallFeeToBoostTotalExcluded(
        uint256 newFee
    ) external onlyOwner {
        require(newFee > 500_000, "Zero Amount");
        require(newFee <= 1_000_000_000_000_000, "Max Limit Exceeded");
        smallFeeToBoostTotalExcluded = newFee;
    }

    function setSlippage(uint256 newSlippageTolerance, uint256 packageID) external onlyOwner {
        require(newSlippageTolerance <= 49, "Tolerance Too High");
        packages[packageID].slippageTolerance = newSlippageTolerance;
    }

    function addPackage(
        address rewardToken,
        uint256 totalToDistribute,
        uint256 timePeriod,
        address[] calldata swapPath,
        address DEX,
        uint256 slippageTolerance
    ) external onlyAdmin {
        require(rewardToken != address(0), "Zero Address");
        require(activePackageCount < 20, "Active Packages Cannot Be More Than 20");
        require(
            timePeriod >= 43200,
            "Time Period Must Be Greater Than Or Equal To 12 Hours"
        );
        require(timePeriod <= 7300 days, "Time Period Cannot Exceed 20 Years");
        require(slippageTolerance <= 49, "Tolerance Too High");
        if (rewardToken == token) {
            require(swapPath.length == 0, "Swap Path Not Allowed");
        } else {
            if (DEX != address(0)) {
                require(swapPath[0] == rewardToken, "Invalid Swap Path");
                require(swapPath.length >= 2, "Invalid Swap Path Length");
                require(
                    swapPath[swapPath.length - 1] == token,
                    "Invalid Swap Path"
                );
            }
        }
        require(
            totalToDistribute > smallFeeToBoostTotalExcluded,
            "Total To Distribute Too Low"
        );

        // transfer in tokens
        uint256 received = _transferIn(rewardToken, totalToDistribute);
        require(received > smallFeeToBoostTotalExcluded, "Received Amount Is Low");

        // Increase dividendsPerShare by this value so new users joining will be enrolled in pool
        packages[packageNonce].dividendsPerShare = totalStaked == 0
            ? smallFeeToBoostTotalExcluded
            : (smallFeeToBoostTotalExcluded * PRECISION) / totalStaked;

        // maps the package nonce
        packages[packageNonce].rewardToken = rewardToken;
        packages[packageNonce].totalToDistribute = received;
        packages[packageNonce].tokensPerSecond = received / timePeriod;
        packages[packageNonce].timePeriod = timePeriod;
        packages[packageNonce].endTime = block.timestamp + timePeriod;
        packages[packageNonce].lastUpdate = block.timestamp;
        packages[packageNonce].swapPath = swapPath;
        packages[packageNonce].DEX = DEX;
        packages[packageNonce].startTime = block.timestamp;

        // increment nonce
        unchecked {
            ++packageNonce;
            ++activePackageCount;
        }

        packages[packageNonce].slippageTolerance = slippageTolerance;

        emit PackageAdded(
            packageNonce - 1,
            rewardToken,
            totalToDistribute,
            timePeriod,
            swapPath,
            DEX
        );
    }

    function alterPackage(
        uint256 packageId,
        address DEX,
        uint256 additionalTokens,
        int256 daysToAddOrSubtract,
        bool addNewTokens
    ) external onlyAdmin {
        require(packageId < packageNonce, "Invalid Package ID");
        require(packageId >= startIndex, "Package Out Of Bounds");
        require(!packageHasEnded(packageId), "Cannot Revive An Ended Package");
        require(packages[packageId].rewardToken != address(0), "Package Does Not Exist");

        // Update DEX state
        packages[packageId].DEX = DEX;

        uint256 rewardsLeft;

        // Update the totalToDistribute and tokensPerSecond values
        if (addNewTokens) {
            // transfer in new tokens, noting amount received for fee-on-transfer tokens
            if (additionalTokens > 0) {
                additionalTokens = _transferIn(
                    packages[packageId].rewardToken,
                    additionalTokens
                );
                packages[packageId].totalToDistribute += additionalTokens;
            }
        } else {
            if (additionalTokens > 0) {
                require(
                    additionalTokens <= packages[packageId].totalToDistribute,
                    "Removing Too Many Tokens"
                );
                packages[packageId].totalToDistribute -= additionalTokens;
                // transfer out unused tokens
                _send(
                    packages[packageId].rewardToken,
                    this.getOwner(),
                    additionalTokens
                );
            }
        }

        // update reward tracking for package, if and only if there are stakers
        if (totalStaked > 0) {

            // Calculate time since last update
            uint256 tSince = timeSinceUpdated(packageId);
            uint256 amountOwed = tSince * packages[packageId].tokensPerSecond;

            require(
                packages[packageId].totalToDistribute > packages[packageId].totalDistributed + amountOwed,
                "Distribution Amount Exceeds Reward Amount."
                );

            // Fetch difference between total distributed and total to distribute
            uint256 max_extra_rewards = packages[packageId].totalToDistribute -
                packages[packageId].totalDistributed;

            // If the amount owed is greater than this value, clamp it
            if (amountOwed > max_extra_rewards) {
                amountOwed = max_extra_rewards;
            }

            // Increase dividendsPerShare by this value
            unchecked {
                packages[packageId].totalDistributed += amountOwed;
                packages[packageId].dividendsPerShare +=
                    (amountOwed * PRECISION) /
                    totalStaked;
            }

            rewardsLeft = max_extra_rewards - amountOwed;

            // update timing on package
            packages[packageId].lastUpdate = block.timestamp;
        } else {
            rewardsLeft = packages[packageId].totalToDistribute - packages[packageId].totalDistributed;

            // update timing on package if there are no stakers
            packages[packageId].lastUpdate = block.timestamp;
        }

        // Edit timing if required
        if (daysToAddOrSubtract != 0) {
            if (daysToAddOrSubtract > 0) {
                packages[packageId].timePeriod +=
                    uint256(daysToAddOrSubtract) *
                    1 days;
                packages[packageId].endTime +=
                    uint256(daysToAddOrSubtract) *
                    1 days;
            } else if (daysToAddOrSubtract < 0) {
                uint256 daysToSubtract = uint256(-daysToAddOrSubtract);
                require(
                    packages[packageId].timePeriod > daysToSubtract * 1 days,
                    "Subtracting Too Many Days"
                );
                // Ensure new endTime is not set to past.
                uint256 newEndTime = packages[packageId].endTime -
                    daysToSubtract *
                    1 days;
                require(
                    newEndTime >= block.timestamp,
                    "New endTime Cannot Be In The Past"
                );
                packages[packageId].timePeriod -= daysToSubtract * 1 days;
                packages[packageId].endTime = newEndTime;
            }
        }

        // Ensure adding or removing tokens does not mess up the totalToDistribute field vs totalDistributed
        require(
            packages[packageId].totalToDistribute >=
                packages[packageId].totalDistributed,
            "Took Too Many Tokens Away"
        );

        // Reset tokens per second, if applicable
        if (packages[packageId].endTime - block.timestamp > 0) {
            packages[packageId].tokensPerSecond =
                rewardsLeft /
                (packages[packageId].endTime - block.timestamp);
        } else {
            packages[packageId].tokensPerSecond = 0;
        }

        // If totalToDistribute matches total distributed, end package
        if (
            packages[packageId].totalToDistribute ==
            packages[packageId].totalDistributed ||
            packages[packageId].endTime <= block.timestamp ||
            packages[packageId].timePeriod == 0
        ) {
            packages[packageId].hasEnded = true;
            unchecked {
                --activePackageCount;
            }
        }

        emit PackageAltered(
            packageId,
            packages[packageId].rewardToken,
            packages[packageId].totalToDistribute,
            packages[packageId].timePeriod,
            packages[packageId].swapPath,
            packages[packageId].DEX
        );
    }

    function setExitFee(uint256 newFee) external onlyOwner {
        require(newFee <= 50, "Exit Fee Too High");
        exitFee = newFee;
    }

    function setEntryFee(uint256 entryFee_) external onlyOwner {
        require(entryFee_ <= 50, "Entry Fee Too High");
        entryFee = entryFee_;
    }

    function setFeeRecipient(address newRecipient) external onlyOwner {
        require(newRecipient != address(0), "Zero Address");
        feeRecipient = newRecipient;
    }

    function endPackage(
        uint256 packageId,
        bool _transferOutTokens
    ) external onlyAdmin {
        require(!packages[packageId].hasEnded, "Package Already Ended");
        require(packageId < packageNonce, "Invalid ID");
        require(packages[packageId].rewardToken != address(0), "Package Does Not Exist");

        // calculate time since last update
        uint256 tSince = timeSinceUpdated(packageId);
        uint256 amountOwed = tSince * packages[packageId].tokensPerSecond;

        // fetch difference between total distributed and total to distribute
        uint256 max_extra_rewards = packages[packageId].totalToDistribute -
            packages[packageId].totalDistributed;

        // if the amount owed is greater than this value, clamp it
        if (amountOwed > max_extra_rewards) {
            amountOwed = max_extra_rewards;
        }

        // alter staking info for package, if and only if there are stakers
        if (totalStaked > 0) {
            // increase dividendsPerShare by this value
            unchecked {
                packages[packageId].totalDistributed += amountOwed;
                packages[packageId].dividendsPerShare +=
                    (amountOwed * PRECISION) /
                    totalStaked;
            }

            // update timing on package
            packages[packageId].lastUpdate = block.timestamp;

             // reset the totalToDistribute
            packages[packageId].totalToDistribute = packages[packageId]
                .totalDistributed;

            // end package
            packages[packageId].hasEnded = true;
            packages[packageId].endTime = block.timestamp;
            unchecked {
                --activePackageCount;
            }

            // determine difference
            uint256 differenceForOwner = max_extra_rewards - amountOwed;
            if (differenceForOwner > 0 && _transferOutTokens) {
                _send(
                    packages[packageId].rewardToken,
                    this.getOwner(),
                    differenceForOwner
                );
            }
        } else {

             // update timing on package
            packages[packageId].lastUpdate = block.timestamp;

             // reset the totalToDistribute
            packages[packageId].totalToDistribute = packages[packageId]
                .totalDistributed;

            // end package
            packages[packageId].hasEnded = true;
            packages[packageId].endTime = block.timestamp;
            unchecked {
                --activePackageCount;
            }

            if (max_extra_rewards > 0 && _transferOutTokens) {
                _send(
                    packages[packageId].rewardToken,
                    this.getOwner(),
                    max_extra_rewards
                );
            }
        }

        emit PackageEnded(packageId);
    }

    function setDEX(uint256 packageId, address DEX) external onlyOwner {
        if (DEX != address(0)) {
            require(
                packages[packageId].swapPath[0] ==
                    packages[packageId].rewardToken,
                "Invalid Swap Path"
            );
            require(
                packages[packageId].swapPath.length >= 2,
                "Invalid Swap Path Length"
            );
            require(
                packages[packageId].swapPath[
                    packages[packageId].swapPath.length - 1
                ] == token,
                "Invalid Swap Path"
            );
            packages[packageId].DEX = DEX;
        } else {
            packages[packageId].DEX = address(0);
        }
    }

    function setSwapPath(
        uint256 packageId,
        address[] calldata swapPath
    ) external onlyOwner {
        require(swapPath[0] != swapPath[swapPath.length - 1], "Invalid Swap Path");
        require(
            swapPath[0] == packages[packageId].rewardToken,
            "Invalid Swap Path"
        );
        require(swapPath.length >= 2, "Invalid Swap Path Length");
        require(swapPath[swapPath.length - 1] == token, "Invalid Swap Path");
        packages[packageId].swapPath = swapPath;
    }

    function claimAllRewardsForUser(address user) external onlyAdmin {
        _cleanUpPackages();
        _claimAll(user, false);
    }

    function claimAllRewardsForUsers(
        address[] calldata users
    ) external onlyAdmin {
        _cleanUpPackages();
        uint len = users.length;
        for (uint i = 0; i < len; ) {
            _claimAll(users[i], false);
            unchecked {
                ++i;
            }
        }
    }

    function setStartIndex(uint256 newStart) external onlyOwner {
        require(newStart <= packageNonce, "newStart Is Out Of Bounds");
        require(newStart >= startIndex, "Cannot Set Start Index Backwards");
        for (uint i = startIndex; i < newStart; ) {
            require(
                packageHasEnded(i),
                "Cannot Set Start Index Passed An Ongoing Package"
            );
            unchecked {
                ++i;
            }
        }

        startIndex = newStart;
    }

    /////////////////////////////////////////////////
    /////////      PUBLIC FUNCTIONS         /////////
    /////////////////////////////////////////////////

    function cleanUpPackages() external nonReentrant {
        _cleanUpPackages();
    }

    function stake(uint256 amount) public nonReentrant {
        _stake(amount);
    }

    function unstake(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot Withdraw Zero Tokens");
        require(amount <= userInfo[msg.sender].amount, "Insufficient Amount");

        // clean up packages
        _cleanUpPackages();

        // claim all pending rewards
        _claimAll(msg.sender, false);

        // decrement amount and total staked
        unchecked {
            userInfo[msg.sender].amount -= amount;
            totalStaked -= amount;
        }

        // emit event
        emit Transfer(msg.sender, address(0), amount);

        // decrement total stakers if new amount is zero
        if (userInfo[msg.sender].amount == 0) {
            unchecked {
                --totalStakers;
            }
            delete userInfo[msg.sender].joinTime;
        }

        // reset rewards
        _resetRewards(msg.sender);

        // take early fee if applicable
        uint256 earlyFee = (amount * exitFee) / fee_denom;
        _takeFee(earlyFee);

        // send tokens to user
        _send(token, msg.sender, amount - earlyFee);
    }

    function claim() external nonReentrant {
        _cleanUpPackages();
        _claimAll(msg.sender, false);
    }

    function claimSelectedPackages(
        uint256[] calldata packageIds
    ) external nonReentrant {
        _cleanUpPackages();
        uint len = packageIds.length;
        for (uint i = 0; i < len; ) {
            require(
                packageIds[i] >= startIndex &&
                    packageIds[i] < packageNonce &&
                    (!packageHasEnded(packageIds[i]) ||
                        packages[packageIds[i]].totalExcluded[msg.sender] > 0 ||
                        (userInfo[msg.sender].joinTime <=
                            packages[packageIds[i]].startTime &&
                            userInfo[msg.sender].joinTime > 0)),
                "Invalid Package ID"
            );
            _claim(msg.sender, packageIds[i], false);
            unchecked {
                ++i;
            }
        }
    }

    // Compounds rewards into more staked tokens, if the package can be compounded.
    // All packages that cannot compound are simply claimed.
    function compound() external onlyEOA nonReentrant {
        require(userInfo[msg.sender].amount > 0, "Zero Staked");

        // get the message sender's balance of EGC token
        uint256 beforeBalance = IERC20(token).balanceOf(address(this));

        // clean and all packages before claiming
        _cleanUpPackages();

        // EGC balance in pending rewards
        uint256 EGCRewards = 0;
        for (uint i = startIndex; i < packageNonce; ) {
            if (
                packages[i].rewardToken == token &&
                packages[i].DEX != address(0)
            ) {
                EGCRewards += pendingRewards(msg.sender, i);
            }
            unchecked {
                ++i;
            }
        }

        // compound all packages that are applicable
        _claimAll(msg.sender, true);

        // get the message sender's balance of EGC token
        uint256 afterBalance = IERC20(token).balanceOf(address(this)) +
            EGCRewards;
        require(afterBalance > beforeBalance, "Zero Compounded");

        // get the difference
        uint256 difference = 0;
        unchecked {
            difference = afterBalance - beforeBalance;
        }
        emit Compounded(msg.sender, difference);

        // apply entry fee
        uint256 fee = (difference * entryFee) / fee_denom;
        uint256 amountToAdd = difference - fee;

        // take fee
        _takeFee(fee);

        // update State
        unchecked {
            userInfo[msg.sender].amount += amountToAdd;
            totalStaked += amountToAdd;
        }

        // if first stake, reset all pending rewards
        _resetRewards(msg.sender);

        // emit event for block explorer
        emit Transfer(address(0), msg.sender, amountToAdd);
    }

    // Compounds rewards into more staked tokens, if the package can be compounded.
    // All packages that cannot compound are simply claimed.
    function compoundSelectedPackages(
        uint256[] calldata packageIds
    ) external onlyEOA nonReentrant {
        require(userInfo[msg.sender].amount > 0, "Zero Staked");

        // get the message sender's balance of EGC token
        uint256 beforeBalance = IERC20(token).balanceOf(address(this));

        // clean and all packages before claiming
        _cleanUpPackages();

        // EGC balance in pending rewards
        uint256 len = packageIds.length;
        uint256 EGCRewards = 0;
        for (uint i = 0; i < len; ) {
            require(
                packageIds[i] >= startIndex &&
                    packageIds[i] < packageNonce &&
                    (packageHasEnded(packageIds[i]) == false ||
                        packages[packageIds[i]].totalExcluded[msg.sender] > 0 ||
                        (userInfo[msg.sender].joinTime <=
                            packages[packageIds[i]].startTime &&
                            userInfo[msg.sender].joinTime > 0)),
                "Invalid Package ID"
            );
            if (
                packages[packageIds[i]].rewardToken == token &&
                packages[packageIds[i]].DEX != address(0)
            ) {
                EGCRewards += pendingRewards(msg.sender, packageIds[i]);
            }
            unchecked {
                ++i;
            }
        }

        for (uint i = 0; i < len; ) {
            _claim(msg.sender, packageIds[i], true);
            unchecked {
                ++i;
            }
        }

        // get the message sender's balance of EGC token
        uint256 afterBalance = IERC20(token).balanceOf(address(this)) +
            EGCRewards;
        require(afterBalance > beforeBalance, "Zero Compounded");

        // get the difference
        uint256 difference = 0;
        unchecked {
            difference = afterBalance - beforeBalance;
        }
        emit Compounded(msg.sender, difference);

        // claim the remaining packages
        _claimAll(msg.sender, false);

        // apply entry fee
        uint256 fee = (difference * entryFee) / fee_denom;
        uint256 amountToAdd = difference - fee;

        // take fee
        _takeFee(fee);

        // update State
        unchecked {
            userInfo[msg.sender].amount += amountToAdd;
            totalStaked += amountToAdd;
        }

        // if first stake, reset all pending rewards
        _resetRewards(msg.sender);

        // emit event for block explorer
        emit Transfer(address(0), msg.sender, amountToAdd);
    }

    /**
        In the event a reward token halts transfers, users can reset their pending rewards (ideally after the package has ended).
        Safe mode must be off, as this function should only be used for extenuating circumstances.
     */
    function resetUserRewardsToZeroForPackage(
        uint256 packageId
    ) external nonReentrant {
        require(!safeMode, "Safe Mode On");
        packages[packageId].totalExcluded[msg.sender] = getTotalExcluded(
            msg.sender,
            packageId
        );
    }

    /////////////////////////////////////////////////
    /////////        READ FUNCTIONS         /////////
    /////////////////////////////////////////////////

    function totalSupply() external view returns (uint256) {
        return totalStaked;
    }

    function calculateMinOut(
        address DEX,
        uint256 amountIn,
        address[] memory path
    ) public view returns (uint256 estimatedOut) {
        uint[] memory amountsOut = IUniswapV2Router02(DEX).getAmountsOut(
            amountIn,
            path
        );
        estimatedOut = amountsOut[amountsOut.length - 1]; // The estimated amount of the final output token
    }

    function balanceOf(address user) external view returns (uint256) {
        return userInfo[user].amount;
    }

    function packageHasEnded(uint256 packageId) public view returns (bool) {
        return
            packages[packageId].endTime <= block.timestamp ||
            packages[packageId].totalDistributed >=
            packages[packageId].totalToDistribute ||
            packages[packageId].hasEnded;
    }

    function timeSinceUpdated(uint256 packageId) public view returns (uint256) {
        if (packageId >= packageNonce ||
            packages[packageId].totalDistributed >= packages[packageId].totalToDistribute ||
            packages[packageId].hasEnded ||
            packages[packageId].lastUpdate >= block.timestamp) {
                return 0;
        }
        // check for package that has expired but not ended
        if (block.timestamp > packages[packageId].endTime) {
            return packages[packageId].endTime - packages[packageId].lastUpdate;
        } else {
            return block.timestamp - packages[packageId].lastUpdate;
        }
    }

    function getTotalExcluded(
        address user,
        uint256 packageId
    ) public view returns (uint256) {
        return
            (userInfo[user].amount * packages[packageId].dividendsPerShare) /
            PRECISION;
    }

    function pendingRewards(
        address user,
        uint256 packageId
    ) public view returns (uint256) {
        if (userInfo[user].amount == 0) {
            return 0;
        }

        uint256 userExcluded = packages[packageId].totalExcluded[user];
        uint256 currentNonExcluded = getTotalExcluded(user, packageId);
        uint256 remainingDistribution = packages[packageId].totalClaimed >=
            packages[packageId].totalToDistribute
            ? 0
            : packages[packageId].totalToDistribute -
                packages[packageId].totalClaimed;

        uint256 pending = currentNonExcluded <= userExcluded
            ? 0
            : currentNonExcluded - userExcluded;

        return
            pending > remainingDistribution ? remainingDistribution : pending;
    }

    function currentPendingRewards(
        address user,
        uint256 packageId
    ) public view returns (uint256) {
        if (userInfo[user].amount == 0) {
            return 0;
        }

        // determine the amount of time since package was updated
        uint256 timeSince = timeSinceUpdated(packageId);

        // fetch the tokens per second
        uint256 tokensPerSecond = packages[packageId].tokensPerSecond;

        // determine the number of tokens owed to holders
        uint256 amountOwed = tokensPerSecond * timeSince;

        // fetch difference between total distributed and total to distribute
        uint256 max_extra_rewards = packages[packageId].totalToDistribute -
            packages[packageId].totalDistributed;

        // if the amount owed is greater than this value, clamp it
        if (amountOwed > max_extra_rewards) {
            amountOwed = max_extra_rewards;
        }

        // increase dividendsPerShare by this value
        uint256 tempDividendsPerShare = packages[packageId].dividendsPerShare +
            ((amountOwed * PRECISION) / totalStaked);

        // get difference between stored value and new value
        uint256 userExcluded = packages[packageId].totalExcluded[user];
        uint256 currentNonExcluded = (userInfo[user].amount *
            tempDividendsPerShare) / PRECISION;

        // return difference
        return
            currentNonExcluded <= userExcluded
                ? 0
                : currentNonExcluded - userExcluded;
    }

    // get all pending rewards across all packages for a user
    function hasPendingRewards(address user) external view returns (bool) {
        for (uint i = startIndex; i < packageNonce; ) {
            if (currentPendingRewards(user, i) > 0) {
                return true;
            }
            unchecked {
                ++i;
            }
        }
        return false;
    }

    /////////////////////////////////////////////////
    /////////      INTERNAL FUNCTIONS       /////////
    /////////////////////////////////////////////////

    function _stake(uint256 amount) internal {
        require(amount > 0, "Cannot Stake Zero Tokens");

        uint256 maxStake = maxStakingPerBatch *
            (10 ** IERC20(token).decimals());
        require(amount <= maxStake, "Exceeds Max Stake Per Batch");

        // clean up packages
        _cleanUpPackages();

        if (userInfo[msg.sender].amount == 0) {
            userInfo[msg.sender].joinTime = block.timestamp;
            unchecked {
                ++totalStakers;
            }
        } else {
            // claim pending rewards
            _claimAll(msg.sender, false);
        }

        // transfer in tokens, noting amount received
        uint256 received = _transferIn(token, amount);

        // apply entry fee
        uint256 fee = (received * entryFee) / fee_denom;
        uint256 amountToAdd = received - fee;

        // take fee
        _takeFee(fee);

        // update State
        unchecked {
            userInfo[msg.sender].amount += amountToAdd;
            totalStaked += amountToAdd;
        }

        // if first stake, reset all pending rewards
        _resetRewards(msg.sender);

        // emit event for block explorer
        emit Transfer(address(0), msg.sender, amountToAdd);
    }

    function _takeFee(uint256 amount) internal {
        _send(token, feeRecipient, amount);
    }

    function _transferIn(
        address _token,
        uint256 amount
    ) internal returns (uint256) {
        require(
            IERC20(_token).balanceOf(msg.sender) >= amount,
            "Insufficient Balance"
        );
        require(
            IERC20(_token).allowance(msg.sender, address(this)) >= amount,
            "Insufficient Allowance"
        );
        uint256 amountBefore = IERC20(_token).balanceOf(address(this));
        TransferHelper.safeTransferFrom(
            _token,
            msg.sender,
            address(this),
            amount
        );
        uint256 amountAfter = IERC20(_token).balanceOf(address(this));
        require(amountAfter > amountBefore, "Zero Received");
        return amountAfter - amountBefore;
    }

    function _resetRewards(address user) internal {
        for (uint i = 0; i < packageNonce; ) {
            packages[i].totalExcluded[user] = getTotalExcluded(user, i);
            unchecked {
                ++i;
            }
        }
    }

    function _claimAll(address user, bool _compound) internal {
        for (uint i = startIndex; i < packageNonce; ) {
            _claim(user, i, _compound);
            unchecked {
                ++i;
            }
        }
    }

    function _claim(address user, uint256 packageId, bool _compound) internal {
        if (packageId >= packageNonce) {
            return;
        }
        if (userInfo[user].amount == 0) {
            return;
        }
        // if package has ended AND user has no rewards AND (user joined after package started OR never joined), return
        if (
            packageHasEnded(packageId) &&
            packages[packageId].totalExcluded[user] == 0 &&
            (userInfo[user].joinTime > packages[packageId].startTime ||
                userInfo[user].joinTime == 0)
        ) {
            return;
        }

        uint256 pending = pendingRewards(user, packageId);
        if (pending == 0) {
            return;
        }
        if (packages[packageId].rewardToken == token) {
            // ensure EGC package balance does not include staked tokens
            uint256 max_balance = IERC20(packages[packageId].rewardToken).balanceOf(
                address(this)
            ) - totalStaked;
            if (pending > max_balance) {
                pending = max_balance;
            }
        } else {
            // staked tokens are excluded if reward token is not EGC
            uint256 max_balance = IERC20(packages[packageId].rewardToken).balanceOf(
                address(this)
            );
            if (pending > max_balance) {
                pending = max_balance;
            }
        }
        if (pending == 0) {
            return;
        }

        // add to total claimed
        unchecked {
            packages[packageId].totalClaimed += pending;
        }

        // reset rewards
        packages[packageId].totalExcluded[user] = getTotalExcluded(
            user,
            packageId
        );

        // compound rewards if applicable
        if (_compound && packages[packageId].DEX != address(0)) {
            if (packages[packageId].rewardToken != token) {
                // Approve of token for DEX
                TransferHelper.safeApprove(
                    packages[packageId].rewardToken,
                    packages[packageId].DEX,
                    pending
                );
                // Calculate `amountOutMin`
                uint256 amountOutMin = calculateMinOut(
                    packages[packageId].DEX,
                    pending,
                    packages[packageId].swapPath
                );
                // Make the swap
                IUniswapV2Router02(packages[packageId].DEX)
                    .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                        pending,
                        (amountOutMin * (100 - packages[packageId].slippageTolerance)) / 100,
                        packages[packageId].swapPath,
                        address(this),
                        block.timestamp + 100
                    );
            }
        } else {
            // send user their reward
            _send(packages[packageId].rewardToken, user, pending);
        }

        emit Claimed(user, pending);
    }

    function _send(address _token, address to, uint256 amount) internal {
        uint bal = IERC20(_token).balanceOf(address(this));
        if (amount > bal) {
            amount = bal;
        }
        if (amount == 0) {
            return;
        }
        TransferHelper.safeTransfer(_token, to, amount);
    }

    function _cleanUpPackages() internal {
        if (totalStaked == 0) {
            return;
        }

        for (uint i = startIndex; i < packageNonce; ) {
            if (packages[i].hasEnded) {
                unchecked {
                    ++i;
                }
                continue;
            }

            if (packages[i].endTime <= block.timestamp) {
                if (
                    packages[i].totalDistributed < packages[i].totalToDistribute
                ) {
                    // determine remaining amount to add
                    uint256 diff = packages[i].totalToDistribute -
                        packages[i].totalDistributed;

                    // add to package
                    unchecked {
                        packages[i].totalDistributed += diff;
                        packages[i].dividendsPerShare +=
                            (diff * PRECISION) /
                            totalStaked;
                    }
                }
                packages[i].hasEnded = true;
                unchecked {
                    --activePackageCount;
                }
            }
            unchecked {
                ++i;
            }
        }

        // loop through available packages, increasing the dividendsPerShare based on time
        for (uint i = startIndex; i < packageNonce; ) {
            if (packages[i].hasEnded) {
                unchecked {
                    ++i;
                }
                continue;
            }

            // determine the amount of time since package was updated
            uint256 timeSince = timeSinceUpdated(i);
            if (timeSince == 0) {
                unchecked {
                    ++i;
                }
                continue;
            }

            // fetch the tokens per second
            uint256 tokensPerSecond = packages[i].tokensPerSecond;

            // determine the number of tokens owed to holders
            uint256 amountOwed = tokensPerSecond * timeSince;

            // fetch difference between total distributed and total to distribute
            uint256 max_extra_rewards = packages[i].totalToDistribute -
                packages[i].totalDistributed;

            // if the amount owed is greater than this value, clamp it
            if (amountOwed > max_extra_rewards) {
                amountOwed = max_extra_rewards;
            }

            // increase dividendsPerShare by this value
            unchecked {
                packages[i].totalDistributed += amountOwed;
                packages[i].dividendsPerShare +=
                    (amountOwed * PRECISION) /
                    totalStaked;
            }

            // update timing on package
            packages[i].lastUpdate = block.timestamp;

            unchecked {
                ++i;
            }
        }
    }

    function getIdsOfActivePackages() external view returns (uint256[] memory) {
        uint8 len = 0;
        for (uint i = startIndex; i < packageNonce; ++i) {
            if (!packageHasEnded(i)) {
                unchecked {
                    ++len;
                }
            }
        }
        uint256[] memory activePackages = new uint256[](len);
        uint count = 0;
        for (uint i = startIndex; i < packageNonce; ++i) {
            if (!packageHasEnded(i)) {
                activePackages[count] = i;
                unchecked {
                    ++count;
                }
            }
        }
        return activePackages;
    }

    function getSwapPath(
        uint256 packageId
    ) external view returns (address[] memory) {
        return packages[packageId].swapPath;
    }

    function getRewardPackageInfo(
        uint256 packageId
    )
        external
        view
        returns (
            address rewardToken,
            uint256 totalToDistribute,
            uint256 totalDistributed,
            uint256 tokensPerSecond,
            uint256 timePeriod,
            uint256 endTime,
            uint256 dividendsPerShare,
            uint256 totalClaimed,
            uint256 lastUpdate,
            bool hasEnded,
            address DEX,
            uint256 startTime
        )
    {
        rewardToken = packages[packageId].rewardToken;
        totalToDistribute = packages[packageId].totalToDistribute;
        totalDistributed = packages[packageId].totalDistributed;
        tokensPerSecond = packages[packageId].tokensPerSecond;
        timePeriod = packages[packageId].timePeriod;
        endTime = packages[packageId].endTime;
        dividendsPerShare = packages[packageId].dividendsPerShare;
        totalClaimed = packages[packageId].totalClaimed;
        lastUpdate = packages[packageId].lastUpdate;
        hasEnded = packages[packageId].hasEnded;
        DEX = packages[packageId].DEX;
        startTime = packages[packageId].startTime;
    }
}