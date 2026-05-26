Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353E03E0C41;
	Tue, 26 May 2026 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797036; cv=none; b=hjMtgINuTqdhVE87GA3Oools8WFXkuzySGp+wG5AKM1MwOinGCJazFRJxR+7p8gDgKWh+ipCiADMxX0BFVPMmu7r0/JYD9kG0yAoFAGq43yRHrrNo5P9SMJ6cqRYtfrYVSODrhlk8MsBWfhspI4PnAZ8V300FbcZ5zNNQ1U+QJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797036; c=relaxed/simple;
	bh=n6ffshSou1HvsBi/aR6iI8hxKyVAfizL701qsGontZU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=r7eK01uzr7nYN4AsDBlWcy3lkYJUQN1unn/x0SwNVh2DLqq8+Jmx4UGIzQOXUgZQWANelr5K/L9IxekA7lKkisQPUfwdv8KxjOucrn54f2Iz4FpdVqOO5BZV3EOWhRpArKvQlJn5186i9kdagisaiTD5deZV2j7VprdE97xXmQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFevu7mh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFevu7mh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F44B1F000E9;
	Tue, 26 May 2026 12:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779797031;
	bh=bmKFm5NXkG4SYqSAeJY2UPlpmSMQcCOYFPH/9CqtcWk=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=UFevu7mhyAfA+Hq8YvutgMw9m0CkEOxhCQqQBzlDmW4onduivyx287MvoKEM8yCbn
	 NOO8pXlkhAoJB9x4NpjKru86thGWrGX+E3V6joawAh2I9y4sSp1IMM5otleGY0bqgJ
	 cabeWM2p9eNawfJEKPjFduwMKpibUutPvh5F/1hwpZEDxgtlGdc7PGOUiuQdTcbCsJ
	 vAttt5nBSej+iBVNK5BJ0k8P7qWRmjRNfQyZVXkH0f1Qf0c301JbeXbGqLYpIftmkH
	 NITWWjHnFjqVvd8jmXYZTRGut+bTj2hIc9PEtksuonvSCeU47+OGdcKArZA+Csjaok
	 AsmSPC0f/tZjQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 14:03:48 +0200
Message-Id: <DISLE3AJXACD.33KV8AQF2M2JV@kernel.org>
Cc: "Zhang Yuwei" <zhangyuwei20@huawei.com>, <gregkh@linuxfoundation.org>,
 "Mark Brown" <broonie@kernel.org>, "syzbot"
 <syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>, <rafael@kernel.org>, <sfr@canb.auug.org.au>,
 <syzkaller-bugs@googlegroups.com>
To: "Tetsuo Handa" <penguin-kernel@I-love.SAKURA.ne.jp>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING in
 class_for_each_device
References: <6a1535d6.820a0220.e7972.0008.GAE@google.com>
 <8e1f611d-e048-446b-a325-aa81c64f837c@I-love.SAKURA.ne.jp>
 <a3ca7056-b215-4632-b86a-c722d82c35e6@I-love.SAKURA.ne.jp>
 <b312f723-1dff-4507-9889-0687b75b55fe@I-love.SAKURA.ne.jp>
In-Reply-To: <b312f723-1dff-4507-9889-0687b75b55fe@I-love.SAKURA.ne.jp>

On Tue May 26, 2026 at 1:59 PM CEST, Tetsuo Handa wrote:
> On 2026/05/26 16:19, Tetsuo Handa wrote:
>> On 2026/05/26 15:08, Tetsuo Handa wrote:
>>> On 2026/05/26 14:55, syzbot wrote:
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    d387b06f7c15 Add linux-next specific files for 2026052=
5
>>>> git tree:       linux-next
>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D15eb779658=
0000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8dd72cf810=
e753a6
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=3D50b5f81fff15=
8669504a
>>>> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43=
e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
>>>>
>>>> Downloadable assets:
>>>> disk image: https://storage.googleapis.com/syzbot-assets/39490dfbc250/=
disk-d387b06f.raw.xz
>>>> vmlinux: https://storage.googleapis.com/syzbot-assets/0789ac7ac5fc/vml=
inux-d387b06f.xz
>>>> kernel image: https://storage.googleapis.com/syzbot-assets/4464df9f5cc=
f/bzImage-d387b06f.xz
>>>>
>>>> IMPORTANT: if you fix the issue, please add the following tag to the c=
ommit:
>>>> Reported-by: syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com
>>>>
>>>> ------------[ cut here ]------------
>>>> class_for_each_device called for class 'devlink' before it was registe=
red
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/drivers/base?id=3D1137838865bfc9a7cd5869c1dc5c22aa45ec12c8
>>>
>>> Why "driver_deferred_probe_timeout * HZ" =3D> "driver_deferred_probe_ti=
meout" ?
>>>
>>=20
>> Here is an analysis from Google AI mode regarding this problem: https://=
share.google/aimode/UO1WnoKPDSbyjY5Qj
>>=20
>> Greg, can you immediately drop commit 1137838865bf ("driver core: Use mo=
d_delayed_work to prevent
>> lost deferred probe work") so that syzbot can resume testing linux-next =
tree as soon as possible?
>>=20
>
> Below diff was generated via conversation with AI Mode in Google Search, =
and
> I agree that this diff should fix the problem. I'm waiting for Greg's res=
ponse
> on how to proceed. Mark, can you carry below diff as a hotfix for linux-n=
ext tree?

As mentioned in the previous reply, I already posted patches for this in [1=
];
will pick them up today.

[1] https://lore.kernel.org/driver-core/20260525012340.3860581-1-dakr@kerne=
l.org/t/#u
