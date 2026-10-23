Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764342;
	b=CnpEvAOXiY5tLBLqEPpn+P9Yo/3TqRxqWhqzcMziUgIA5sCWxeRFN6favpaCKQvobWq5
	 HxNE6ZIwp2BprxE75oNH0Ff12LGT/cwshGPyfBUqkWN9PCX2gWETaGh/x7FQ5+JggoVAx
	 vAOaPr4bkzyQTQljs7Owzj0PAth5wqSf0UMvaWhOZz1U5pNrAdwpSFfjhp2mJupd3s4UB
	 UG7injB+oI2hNZnqtKnVEcQiqdvnGbxRKAUJj20/gJWU/bCmrMtTBrPXT6Vj5bX3qBkst
	 D0hLiIOXOtr59+f7K0eB5jvt0KZKxtXmIVtMd1RzkO4HYBE8NVW/fnP0roRVOwJHnNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=BUJVWluZQW/qDMSCSzMsGJRAgytWrmfDDzAkl2tvmys=;
	b=uzaOrZLCQunVTGdSudjdgzqTUzrU9FSVL0452t7InRlOCwkJMk/Ei0SIHsXTNaK+G+LH
	 8nAOjPRTw6VsWRXBxEi2hTnEASv0fjMvqUY0QDtDEajh/OHJvH/58gtTKa4vlsAIB3cVM
	 1Bjr3X6xxbUsa8o7G+0Xf9/ha7prpNlsQslJqlHWGstpyUSunR4o9V6UYGXwqNr+hIsG9
	 57gh+6HPWOH937dC9eQo6X9pY5bGGz7sgv6rPAD8MyKQ5vSa7vuPfaij21mlXPu8PdsNp
	 EXMkpDnAJEqlaExIkvzwNiJPoeUJTGLoP6PIPc502gTdFNRPCzTmgBlvGj/z7SLVgCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jalhkZg5;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EF3606A31E
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 14:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30EF3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jalhkZg5
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c43373ae89aso149117466b.3
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792764340; x=1793369140; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BUJVWluZQW/qDMSCSzMsGJRAgytWrmfDDzAkl2tvmys=;
        b=jalhkZg54Jd4pzJCXa6MdZ/vDNIK2/tnKfJ3jKPenlQ70bK3nDxwOKIssDakKxfabB
         qIrEZr+duEr3YaFLHqS81DP0K7mvWUKLhlhFWXaPOURt+ID/S3eVr0TYLGNGdNSi1rkS
         bXUIHWcmeUML9xL/vVkyzjYFJpHjGjSZStxTU1/PO6xgKYXWV3wrEF4Shgcj3ZUxwqCQ
         ctU3dqu1acHgI3vaSA/jOWhR2itdkxrHWzvF40zdIWn+rmbmPljiMeU8V31Nz2gDB+GN
         B74UC5396fgtDrOwBk+0mlmJQqbvadR7mBwS71ZcG5JGouxHT+U1lhc4t4eB5znZsUAK
         fg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764340; x=1793369140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUJVWluZQW/qDMSCSzMsGJRAgytWrmfDDzAkl2tvmys=;
        b=GmDZdHAtHxaPewie9qub/2JkhvT95SgqQ9x+NL3MV08NRYQIyGuEsSiU2Flo9uIRck
         8Xuj88G5bDb5ByTixCSVz4+yMPAk0pRzXNaO8NAnEwYfvPxC2RvEPXlVFwfwcLzxNQ2C
         FKbfIqY7z/lDxhCLfSTQqSxtQu0wOwJ6pgNOwrlSQqPp0LyBECyMXUO2+5TdXAx83CYn
         iCNLASkoeblVSuVU9m1NC+ue4Tdu0LctzaHNAPPBIuyWM+LVx5CHWtCOMVVFq9f0hWMl
         dHo0nBx8oAYbJZEcoFv2bnm/O5iUHOTZRu3T1Dx3oXMyOLMhgchzczUXr/g6jL85nDqB
         xq8g==
X-Forwarded-Encrypted: i=1; AKwUvBwV2j6B58syhjQBxCqHN76hf6xq+o4CEptD38NUUuwGh8NDmmsO7kHUxYjZ4E7IwCqtsyyYJEnzxiTf8w==@lists.linux.dev
X-Gm-Message-State: AFq9FYLkd5YR9qaLE78ScxaKMPKfYGlyqrBZp9RNj+oFioPjHaYhmLg6
	sG5tEMyWO70/aYGXZUzOHqLyQTvKHTd4a2ut/v2DJh+xvS0Ic9yg5Ht8
X-Gm-Gg: AYBFou3/rTMH3wBGXdPQfLnoxVm7TbRfjLC3cP//llSCuILF50eoh17jdJvyPoOBfm5
	YBn1gL4w3HScqAHVp2Ga2JNzYgTCSJlmqJBMwGSHzjcRhTQG3ud6lUf6jcdv6qyNlOwgtXI9f3H
	i3b5AkhMo+ZumC6576HEwYfBH5x8WG/YM7cmsCSdIsI9FCKubgIVlPUbb/4bUTEIf5UzvIeKXBw
	cjA4CT+dxVSzn83+g5jNuA9LmPp4V2dvohebj3+IB44JGgY3KVwJ5Lozwof3Qd3YZXr3/jgd+YI
	WMJtRAHjICT/649p/oZaFkHGZKF1EN6DBfPDphAHP/RruNtm1Fn4q+8uFSl0ZhaflSnEfVTNrGU
	YM6eRBbkX6glrfoo5GhQ/eLzQxyxjGD54O9qngSwYdrBch0JDwMr+Jl8Ofz2IPObCGKrTqPYuSM
	WWu76hBHD6GBsAFaw5O505gt1GBro0CcQFsPBDIm3t6cJJhgCPEplUIN3ptLbS2hZGR7mEmZCti
	yBZltKxDlYCt8vV2/SugS8ihrZId7k2ANFUG0DrV+sasXSmvVblcFiEmcNWndHIGAnixrWdeoQx
	CBvOiSgK+fZIoUVFUMikz3zmc2tfIgme2RKy7QADQQJOdbzGtusdxddAYKpvL3efT3lHEzHctDS
	N2iNsNp4OX47HXUw0EcSGIJHm7dwJ4iq/vBxYfOsQJ4vrjsYkPES4lzAw+yZyvLwdie4Q949lKV
	dhGILBfez9pRSdCU8=
X-Received: by 2002:a17:907:930a:b0:c41:30be:4f84 with SMTP id a640c23a62f3a-c46a90ae916mr376211766b.9.1792764340190;
        Fri, 23 Oct 2026 07:05:40 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8ba181esm4707666b.25.2026.10.23.07.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 07:05:39 -0700 (PDT)
Message-ID: <7a212208-74f2-4d79-8ca2-a1502d0e0a1c@gmail.com>
Date: Fri, 23 Oct 2026 16:05:38 +0200
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] kernfs, autofs: fix pipe lock cycles through sysfs
 stores
To: Ian Kent <raven@themaw.net>, Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>,
 driver-core@lists.linux.dev, autofs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
References: <6aa23178.f81106d8.2ab401.0006.GAE@google.com>
 <cover.1792577179.git.krystianmkaniewski@gmail.com>
 <649966b83b39fcdd25e892fc3c6732a1@kernel.org>
 <22d41f2a5546d3bc90a1b3ad24ed3656588a854f.camel@themaw.net>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <22d41f2a5546d3bc90a1b3ad24ed3656588a854f.camel@themaw.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tejun, Ian,

On 10/22/26 04:46, Ian Kent wrote:
> On Wed, 2026-10-21 at 11:48 -1000, Tejun Heo wrote:
>> it doesn't make sense to change the locking scheme for it.
>> Can we just disallow splice on /sys/power/resume instead?

That would address the direct case, but it would not make this report
go away. The lockdep report combines two separate operations.

First, the reproducer splices a pipe into the cgroup v1 devices.deny
file. This records:

        &pipe->mutex -> &of->mutex

It later uses a normal write() to /sys/power/resume. That records:

        &of->mutex -> &sbi->pipe_mutex -> &pipe->mutex

There is no splice into /sys/power/resume in the reported sequence.
Disabling splice on that file would prevent some direct deadlock
cases, but the first edge of this report would still come from
devices.deny.

A complete restriction for this attribute would also have to cover
both splice directions. With an O_RDWR open, a splice read takes the
output pipe mutex before the same of->mutex. Another thread can write
through the same open and reach autofs in the opposite order.

Kernfs splice support is established behavior. Commit f2d6c2708bd8
("kernfs: wire up ->splice_read and ->splice_write") explicitly
restored it in v5.11 after the VFS stopped providing the implicit
fallback. The pipe has been locked across ->write_iter() since 2014.

I agree that changing serialization for every regular sysfs store is
too broad for this case. Before preparing a v2, I would like to
clarify the intended scope.

> Not only is the description hard to follow the example is flawed

You are right that the cover letter was hard to follow. I should have
described the two operations separately. The automount itself uses the
normal empty directory case.

The reproducer creates a detached indirect autofs mount with its own
daemon pipe. It changes its current directory to the root of that
mount and moves out of the daemon process group. It then writes the
relative name "0x0000000004000921" to /sys/power/resume.

resume_store() calls lookup_bdev() on that string before trying to
parse it as a device number. The pathname lookup therefore starts in
the autofs root. The new negative name triggers the normal mount
request for an empty indirect autofs directory.

The dentry whose ->d_automount callback runs belongs to autofs, not
to sysfs. There is no autofs mount on top of kernfs in this
reproducer. Kernfs is involved only because resume_store() starts the
pathname lookup.

The change which made this path possible is 1e8c813b083c ("PM:
hibernate: don't use early_lookup_bdev in resume_store"). It replaced
early_lookup_bdev() with the normal pathname lookup in v6.5. That is
what made autofs reachable from resume_store().

> The other possibility I was thinking about when I saw that report
> is to disallow file systems that don't make sense for automount.

I may be misunderstanding this suggestion. In this reproducer, the
filesystem which owns the automount dentry is autofs. A restriction
based on the filesystem owning that dentry would therefore see autofs,
not kernfs.

The lookup from a sysfs store is also not unique to
/sys/power/resume. For example, with CONFIG_BCACHE=y,
sys/fs/bcache/register also resolves a user supplied pathname.

The exact reproducer records the lockdep edges with different pipes
and different open files. It does not deadlock on those mutex
instances. After sending the request, it waits killably for a daemon
reply that never arrives. Related setups can deadlock when the daemon
pipe itself participates in splice or tee.

Given these two separate paths, did you intend to prevent only direct
splice operations on /sys/power/resume even though the reported class
cycle would remain, or should a replacement also eliminate the
lockdep report?

A per-attribute splice restriction alone cannot do both. If this does
not justify new kernfs infrastructure, I can leave it alone.

Thanks,
-- 
Krystian Kaniewski
