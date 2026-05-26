Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381683DBD6F;
	Tue, 26 May 2026 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796979; cv=none; b=CfVgrSPxkThPrd8aQDfUAIuXJW3WB2hThVNHRlms5tRGWaXCDi3nSJNA9xewkTqZGGHsifu1ZaaFUAHppMVSlW0/WpxylWBF6cNmEd6X3Y8obJX5OzguIdvEYSsc5zA+RA99EwwqIqNNAjh79sWb3RigoPlrL8+cbI0Gpp4fIA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796979; c=relaxed/simple;
	bh=xN50JvEao8DgcnB8dH664WOc2F8j3VqWipG8r+3G9U4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=q/AfSu94W2dtQyLrQd0OB2EHkaXxdzh4+9C+fPjZZUp3vhu2QiNOG7eWDxoAZ+HbmuGD4Unxq7rXutGvkekdNyRBoNnAfCm4izCe2zawT5FZXMT/qjL9Fu56x5rlZJTaLQ/x57Fov8PUrk6U/HlavYLksMK/8SPkMguWLz21ygQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k42lSbdX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k42lSbdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885FE1F000E9;
	Tue, 26 May 2026 12:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779796975;
	bh=zgns/AcbFBPNd7vjCBbWzbcPqd4UDfeGNspKvZd2KWQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=k42lSbdXLRS6VluCQ+PUjHSJFB0Iis+QOvHSUhv+IXDbV9yiMafKGIkP+CQIrJ/6S
	 +SOyLUbA1L2F8SRfYJpVS76MlFe9lAuji6AE20IWi6zTRkRCNlSGPej00fxLWzmLx7
	 gaXJ3tjpM1D1+xiFLOa9+xaC3GRyhIAP0ptgXz+V6IeXYjf5YEO+V8kwpwY5ZVMSCn
	 eojYxsRFhmY1+2SqVb8pYwfInYuAho13BIWfVoVVfFblXXAsCHIihv9Na9a1GN4YbZ
	 EwgNMmmJjYu6gj0zr1zTrWHQ/qBfCbQdKXWaOIh8nxmjo6hF/8wubznHKT5sAMiwcM
	 yE5VWd5iB5O/A==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 14:02:51 +0200
Message-Id: <DISLDDGB663S.248HHW19FMX3M@kernel.org>
To: "Tetsuo Handa" <penguin-kernel@I-love.SAKURA.ne.jp>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [syzbot] [kernel?] linux-next test error: WARNING in
 class_for_each_device
Cc: "Zhang Yuwei" <zhangyuwei20@huawei.com>, <gregkh@linuxfoundation.org>,
 "syzbot" <syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-next@vger.kernel.org>, <rafael@kernel.org>, <sfr@canb.auug.org.au>,
 <syzkaller-bugs@googlegroups.com>
References: <6a1535d6.820a0220.e7972.0008.GAE@google.com>
 <8e1f611d-e048-446b-a325-aa81c64f837c@I-love.SAKURA.ne.jp>
 <a3ca7056-b215-4632-b86a-c722d82c35e6@I-love.SAKURA.ne.jp>
In-Reply-To: <a3ca7056-b215-4632-b86a-c722d82c35e6@I-love.SAKURA.ne.jp>

On Tue May 26, 2026 at 9:19 AM CEST, Tetsuo Handa wrote:
> On 2026/05/26 15:08, Tetsuo Handa wrote:
>> On 2026/05/26 14:55, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    d387b06f7c15 Add linux-next specific files for 20260525
>>> git tree:       linux-next
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=3D15eb7796580=
000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8dd72cf810e=
753a6
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=3D50b5f81fff158=
669504a
>>> compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e=
25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
>>>
>>> Downloadable assets:
>>> disk image: https://storage.googleapis.com/syzbot-assets/39490dfbc250/d=
isk-d387b06f.raw.xz
>>> vmlinux: https://storage.googleapis.com/syzbot-assets/0789ac7ac5fc/vmli=
nux-d387b06f.xz
>>> kernel image: https://storage.googleapis.com/syzbot-assets/4464df9f5ccf=
/bzImage-d387b06f.xz
>>>
>>> IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
>>> Reported-by: syzbot+50b5f81fff158669504a@syzkaller.appspotmail.com
>>>
>>> ------------[ cut here ]------------
>>> class_for_each_device called for class 'devlink' before it was register=
ed
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/comm=
it/drivers/base?id=3D1137838865bfc9a7cd5869c1dc5c22aa45ec12c8
>>=20
>> Why "driver_deferred_probe_timeout * HZ" =3D> "driver_deferred_probe_tim=
eout" ?
>>=20
>
> Here is an analysis from Google AI mode regarding this problem: https://s=
hare.google/aimode/UO1WnoKPDSbyjY5Qj
>
> Greg, can you immediately drop commit 1137838865bf ("driver core: Use mod=
_delayed_work to prevent
> lost deferred probe work") so that syzbot can resume testing linux-next t=
ree as soon as possible?

I already posted patches to fix this in [1]. I will pick them up today.

[1] https://lore.kernel.org/driver-core/20260525012340.3860581-1-dakr@kerne=
l.org/t/#u
