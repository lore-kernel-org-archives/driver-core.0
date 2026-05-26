Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCA2384244
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 06:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775737; cv=none; b=kDT4ZcJ4/c9MwmaRBXx6ksaQnjb0yqyw8Hl+PzCmhl0qbtooBkefkOpMYYjcN9IdK1LErehJsrcGw3FmyteedAIcYthrtM2HP5Dzz3XxDywq4ET6elRUA3OqIPTCA+jx+DxHWBCphBSaR/FddvgMPglxq9ycxx6xW4tlG4uN6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775737; c=relaxed/simple;
	bh=EJZdnr3Q+Dn4BwkGh/BZ7vdJuRYE51StPuZwiuAy1dc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Fq23p0S2rG5bsLs80g0pU39GjawELXr0asOeFiHnXC0T38ILaGnfQ14CD59cMIFYJ4r4BAkgrbiXMqR8nSWETVxV7FCqs0MLJKTLzdoxe7gSSGDY567yiB+V34kD4kuJTc9TQDF24LXRPftO6jeczhXgTUTc6570dvwjLkd16l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 64Q68JST017567;
	Tue, 26 May 2026 15:08:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.5] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 64Q68J2j017563
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 26 May 2026 15:08:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <8e1f611d-e048-446b-a325-aa81c64f837c@I-love.SAKURA.ne.jp>
Date: Tue, 26 May 2026 15:08:18 +0900
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING in
 class_for_each_device
To: Zhang Yuwei <zhangyuwei20@huawei.com>
Newsgroups: gmane.linux.kernel,gmane.linux.kernel.next
References: <6a1535d6.820a0220.e7972.0008.GAE@google.com>
Content-Language: en-US
Cc: syzbot <syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com>,
        dakr@kernel.org, driver-core@lists.linux.dev,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, rafael@kernel.org, sfr@canb.auug.org.au,
        syzkaller-bugs@googlegroups.com
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <6a1535d6.820a0220.e7972.0008.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav202.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/05/26 14:55, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    d387b06f7c15 Add linux-next specific files for 20260525
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=15eb7796580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8dd72cf810e753a6
> dashboard link: https://syzkaller.appspot.com/bug?extid=50b5f81fff158669504a
> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/39490dfbc250/disk-d387b06f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/0789ac7ac5fc/vmlinux-d387b06f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4464df9f5ccf/bzImage-d387b06f.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> class_for_each_device called for class 'devlink' before it was registered
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/base?id=1137838865bfc9a7cd5869c1dc5c22aa45ec12c8

Why "driver_deferred_probe_timeout * HZ" => "driver_deferred_probe_timeout" ?

