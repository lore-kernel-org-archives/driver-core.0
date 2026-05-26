Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFA33C98A4
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780325; cv=none; b=sGeXBHPk6m+Jx1STxQkL+T6Q3L2OvQoMElCR3lT7JN/YiNNBywwG5htQRTtJ70lu2FOJX1Iv8fLB5WhkXqtiYZRM/2z7bSMu8l6YODZ2r4uA8uaPZrN1CtxSHxWnXffsILVDWzMF9UbiiHjBgxz0iSSB6FaoIarP7KPoithgSzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780325; c=relaxed/simple;
	bh=YyJXAFPJnij3NLJHxZg6IQkz8I02isqp8dMhzRPfNyc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z5YrKrLmx3Gd86qcIXa4epsp6kVJSGswQBzp7bCy1+jwfXocpgsj8CZ7EEV5IYmJ59LF6KRbZ5jbcsSa7mqswqNXsVbHbm7xyk2KAXqozDvCO+QsI2c3xtWlcyyHN1qYwAeAA91lUvP1arsdgxGecnICZnZ6R/0dfVIIKCO3+ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 64Q7JwAM036566;
	Tue, 26 May 2026 16:19:58 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 64Q7Jvea036561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 26 May 2026 16:19:58 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <a3ca7056-b215-4632-b86a-c722d82c35e6@I-love.SAKURA.ne.jp>
Date: Tue, 26 May 2026 16:19:57 +0900
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING in
 class_for_each_device
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Zhang Yuwei <zhangyuwei20@huawei.com>, gregkh@linuxfoundation.org
Cc: syzbot <syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com>,
        dakr@kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        rafael@kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com
References: <6a1535d6.820a0220.e7972.0008.GAE@google.com>
 <8e1f611d-e048-446b-a325-aa81c64f837c@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <8e1f611d-e048-446b-a325-aa81c64f837c@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav305.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/05/26 15:08, Tetsuo Handa wrote:
> On 2026/05/26 14:55, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    d387b06f7c15 Add linux-next specific files for 20260525
>> git tree:       linux-next
>> console output: https://syzkaller.appspot.com/x/log.txt?x=15eb7796580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=8dd72cf810e753a6
>> dashboard link: https://syzkaller.appspot.com/bug?extid=50b5f81fff158669504a
>> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
>>
>> Downloadable assets:
>> disk image: https://storage.googleapis.com/syzbot-assets/39490dfbc250/disk-d387b06f.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/0789ac7ac5fc/vmlinux-d387b06f.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/4464df9f5ccf/bzImage-d387b06f.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> class_for_each_device called for class 'devlink' before it was registered
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/base?id=1137838865bfc9a7cd5869c1dc5c22aa45ec12c8
> 
> Why "driver_deferred_probe_timeout * HZ" => "driver_deferred_probe_timeout" ?
> 

Here is an analysis from Google AI mode regarding this problem: https://share.google/aimode/UO1WnoKPDSbyjY5Qj

Greg, can you immediately drop commit 1137838865bf ("driver core: Use mod_delayed_work to prevent
lost deferred probe work") so that syzbot can resume testing linux-next tree as soon as possible?

