Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BAF1CD1E4
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 00:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772498758; cv=none; b=BwTc6T6V6lDm7dvGFkxn9r2syR45eGwiLb3YFX+JWvx05xu31ThhNUssdDbxEA7MNQJe6QqgTJqaIeQAs3SnQtA0EbTvU4R5aLcyf3JOHyRcQ1vtNA5nUy1LIiTUX0uPAZW3ocDc0VxQ2cdETjOG4fOzfwDAGFfhHSulL33iT8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772498758; c=relaxed/simple;
	bh=rvp6JDh8SE90b8rGbTcteTsvQoKBmjO/2W/jXznh/Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=M7lJe5J7YVGe5r/NiykBf8H8swnQ248c4K0T4NXWMwPW0Yjpdp5ZpiJMbbIjYH0dWwmYFMzUZM5P/uiL8qJ6VAwLSgnJiWSuIc4+LueLQQDC79QV1QCdObQRZ4xBP39ESdABosK95LCul3vKFmNAvfhODnXmpktprjynGFHulKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=WjgifQ0t; dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b=pQsoDkd4; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="WjgifQ0t";
	dkim=pass (4096-bit key) header.d=davidgow.net header.i=@davidgow.net header.b="pQsoDkd4"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772498748;
	bh=rvp6JDh8SE90b8rGbTcteTsvQoKBmjO/2W/jXznh/Ws=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=WjgifQ0tMi+lBOki1OO5tCtqdjtFi/lbipQt5kbEkIflzZ1WDXRhFOkyPLvwhLZyY
	 3BLR8PMYmCE5HS8rR2L4bRNbimSBTOLd1xwRSjfvvGcjke6nGY3448CxbDV4/YQEuc
	 gPTEK+GqSlJk1/6EjioFaKloCHW/w8vCq6erC3QmFMO1yY/MI4mmhPtnDUcX2Je7m8
	 9dQSPJbifXM9V26qu9UG8+nqxa5PkBgkG+uQaOqxwl3AFP/eU67FVUTLNjUr91evlV
	 hhCKt1Uh0Q8TuPMyRygtgQqM7YKNgbijjMOGQhx/2FnC9deWxXnobU2z2Zj7d0qCx5
	 QZBzxKJNzZgprbne1/MDz1jJCOayaRRmzrS+ysIyc1/IUqrMPcxcO141muD4zjrKzN
	 m0G4ms993IMxQ7g4ilE3zEzZxcL1KBlzWLrydD1rJRPVtjvCNDECQu7hilper3+jIq
	 4Y2JNpbzPHW/fwm6Jl0Gd8FTNEwRzD9vMnnBtADWLl2BRY6k+oINq4Bhy2rmqCfR3o
	 rHmEiixuBVNOZmz2bwYabJYzOOP8wqHV5AGoJrhcieqdbbLFNSACAh0C6kQgcgcmfo
	 EFfRVA9JwHdhPwn47jqgj1C7Z1zJXsMDPtaE0U4ZRAU4Nt1QpHCNxLnv2tHoqBm9CB
	 /X1zWpN4PwrljLgIp9usqePE=
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 424271E7A98; Tue,  3 Mar 2026 08:45:48 +0800 (AWST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=davidgow.net;
	s=201606; t=1772498746;
	bh=rvp6JDh8SE90b8rGbTcteTsvQoKBmjO/2W/jXznh/Ws=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=pQsoDkd4uvz7sO5yjiOrrkCCsk3BkkOS3OOfD7sqhedGJWNR9Y9tTJ07BTkGewBfZ
	 fiURueQlzH+qpg0AVkroh3mIWBqgbx4SKIaI5DWv9QrbqdQNwZ7VqY4I5YF6cJGQje
	 6KdVAa3q060yp2zdsMd0w+sJFnePXcxZsse3XOdDnwL1VHpT3WZ+Ysr1oN1uJz57ig
	 BdyY//wslRt59fM4SaUa1AhQuDmzggidvRDagZo6A3uYfzfqhs2QzP/fM20zW0SImz
	 YEwmkB/AqwCXnneTu+khhTyGuWjVQiMTAzHBKrlqdc2wpjptXf8/hzmtYVh+59ze5m
	 Vdnql5ayjl4o6+maal9ghwVgVATU8oz3wmAsa6RzEVBhmjHTXKcI5t84Pb+2ouWxjv
	 0vDZK3pTaf1v9e2AOyoJTKp2mWXl0lVScXN6DcOHdZe0TZnc2lbeMjgGzMMFmwQT4R
	 gVwEp6nO24ipr8l+R9pEMAyTnOnpJcloTjEm7KsoIKFES1FhmYBNX6GCVJSKr0ZFH8
	 itRHL3UBNeochH4JkkXxmuiXzey3Ku4jJpjTI0VvIEOq1FupHvezMpqnGPoV9/TGng
	 4zR4R6jtPspOnJZDFnErjVaksBYAJKfBH+Khov1j9eW2WxKahja6QttSLblg17Cudi
	 xlKQTLL36Anke7tLL4E22EZY=
Received: from [IPV6:2001:8003:8824:9e00:6d16:7ef9:c827:387c] (unknown [IPv6:2001:8003:8824:9e00:6d16:7ef9:c827:387c])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id B40151E7B71;
	Tue,  3 Mar 2026 08:45:46 +0800 (AWST)
Message-ID: <a5e8670e-1b39-4b83-bd65-2584fa382d5e@davidgow.net>
Date: Tue, 3 Mar 2026 08:45:42 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CRASH] kunit failures in platform-device-devm
To: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Weisbecker <frederic@kernel.org>, Waiman Long <longman@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <aaRH-aXYKntYyjRS@google.com> <aaWtcMpwHUt9E5bD@google.com>
Content-Language: fr
From: David Gow <david@davidgow.net>
In-Reply-To: <aaWtcMpwHUt9E5bD@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/03/2026 à 11:32 PM, Alice Ryhl a écrit :
> On Sun, Mar 01, 2026 at 02:06:49PM +0000, Alice Ryhl wrote:
>> Hi DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS,
>>
>> I've experienced a fair number of different crashes when running kunit
>> locally. I just ran this command on v7.0-rc1 or upstream/master:
>>
>> ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_PCI=y
> 
> Bisection has been carried out!
> 
> The culprit is commit 5564c12385b7 ("kthread: Include unbound kthreads
> in the managed affinity list"). Cc'ing everyone from this commit.
> 
> On this commit, kunit (executed using above command) crashes for me 70%
> of the time (14 out of 20 runs) with kernel crashes (Oops) and
> refcount_t use-after-free warnings in pm_runtime_test_cases and
> platform-device-devm. On the parent commit, I was able to run kunit 24
> times in a row with zero kunit failures.
> 
> The same crashes occur on tag v7.0-rc2, so this issue is not fixed.
> 

Hmm... I've not been able to reproduce any crashes with stacktraces 
which look similar to yours, but given the bisection, could this be the 
kthread exit use-after-free?

Could you try the patch here, and see if that fixes it:
https://lore.kernel.org/all/20260226-ungeziefer-erzfeind-13425179c7b2@brauner/

Cheers,
-- David
