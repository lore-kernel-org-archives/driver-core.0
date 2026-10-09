Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E86A4E1C9F
	for <driver-core@lists.linux.dev>; Fri,  9 Oct 2026 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555593; cv=none; b=E2RYXEbkfB3SX6KCYi7QWYzXOb63opuo2V129uzd3rM1+Utju1ghvt/gHO3c2PDAnhPWikoin9OVySzfBB4Tlq4vnoFI4EjBiZ/waxsu3Ft077+SThYVuwvFUmuuuPLi5aM477bGDdWxrC/dM+cTK2KMVLoEVrnXs0lcGjESy00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555593; c=relaxed/simple;
	bh=AGVPjqicrTax98tPY6K/BUxJ7u2Bc/hgEP7b6d2MePY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NpFh1gdhFabXBfkUr168BlM/WepN33Of9aGH3dvGNaZohXwvtHt8rnOeDRuAXSJy8OBlaAWAx56KsSraWakBLgdFe+elr7Fz0zOTMzSq5nec4OjCFmn0khF2x3sjOy26dszELxpBRReRtLcgH0kNmWT28xfUJ3DlHLuB6QmcDbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org; spf=pass smtp.mailfrom=fastmail.org; dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b=DX7vyj/K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NttPwU+t; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="DX7vyj/K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NttPwU+t"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4E00A140010F
	for <driver-core@lists.linux.dev>; Fri,  9 Oct 2026 10:19:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 09 Oct 2026 10:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1791555588; x=1791641988; bh=AGVPjqicrT
	ax98tPY6K/BUxJ7u2Bc/hgEP7b6d2MePY=; b=DX7vyj/K63yNh08WPbwdA2aFDU
	0/c+kyQxW7yXleo5FRM8LLYFQJHFQU0mV4UcYu8eOIhNbFlfP3FzPvzHUgDv/8MP
	PU8hcVjj6anaas7B4hyyVrmbmiyVBEW47+k/rtky5mKKarije8SqikVp1ACXa7bo
	diJw0v6Krb/jfa6PjT0njdLaUIH1NLAfhonyohpZkRGR/tu28IrA+BkBWExGTey6
	Y7kw1WGoaHx0svKliqx/L52EcqbS4YO8WcgaCw/edi50kMxw+VTtCZGFRyXAMV+H
	boEmTHRlAm57oGFsVBZUDJNJJlLFa9wmmouE/jwwVn4nwAfM4vJNxPt11Xdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791555588; x=1791641988; bh=AGVPjqicrTax98tPY6K/BUxJ7u2Bc/hgEP7
	b6d2MePY=; b=NttPwU+tlr67ygR3H/k7t1PSBdyz0EaQ8u3m5Ut2/ROY5NKROny
	GJdFXTxATg1B8nNj4VQq/OGMXPj/ynVRwm3WuZbyRL9gfZkhLUbAjIKLR7yFPUA1
	BNV3IZQmoOZNJzXEwpckjGztBUTzlSQGWP6FHLNsX8EoUgak4EUvFKH4sybwBpGi
	EhTBfqzpJvgjihbc9Q6WrNBy8FUPJ8d5/rDMkPXnZQgEO9efx/8+HaHdyTBgeKmX
	zsww+dD+OrhcKwfqxiSEv5/O/Dtb0eU/yBraCIHWeZH+fziuyYQo1B28yBMiBQo1
	RgdbsQe8V8UIPaG21peagmdhJKWtj0OxYTg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791555588; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGRyaXZlci1jb3JlQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:OGhMGTRJLb5LPKqwgOIvlWjm4uWIdhT9SrSZoxaV7IaYcRd
	CSb7yRJysOT6IrhmLaccVrVWJEeLcovHCPeUnka63svHmLp9vZaaOulsAn5Hwgj/
	qmcy8QcgeoQMztw/x+Hni0RSNiiPZvdZ9c4ODcmR29hcMjAZyS/jsTjfz6lRyJGj
	lSMlrBjBcAQ7201qPfmlvMBlpWhRt6UnJgpQySgSwUABfZpYdO0iNyMwtdS5kSgP
	6p61SfOExo3yIMcYqSyPt036laVZizo0iNYvqOHPCtNIybqPjgqDOYCHJw5/h71t
	qEXrRHpKhpPJOn3BRw7NJHicCbbdsURR7jWE+mQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:c8bKZDb+nDxVxVOje5BAY7NFhfce6mHaLT1MhSKE+70=:AGVPjqicrTax98tPY6K/BUxJ7u2Bc/hgEP7b6d2MePY=;
X-ME-Sender: <xms:A_jIau5EZb71QshdNOiNRhmE1xJGXve6yBvoJXAiLgmrpGu63kw9lA>
    <xme:A_jIaoXjFQ5CvcZkFQDJmsn6NXYjUP8zqXFcnS3GnYMHCUOli4xCQjXOt7aPoEL_8
    AOmyPis3JtdZ5x7XzGpM-6YPud0lLtA0b-M9y0YYBQIxM4H-K1d01fE>
X-ME-Received: <xmr:A_jIauJZXodVxtKuO_MuO2LrxS0jQRxZHWpzVuUtMh2c2AA6wwXHzh_Y4ck>
X-ME-Proxy-Cause: dmFkZTFo33oLHXN5YBNckb5fyYNOz6OBcIa8W6fUlslLcH4h/bv3An3xRCr2pXytzGRLiL
    pidtqkKaMgdsUXxcbbMWraoCVdgzSJZcFwtNVAmhBnPZbx8pDunQAO26IX8sAMg9D7QB8B
    Iu7fA6+Rc7vNi1BxZV4pjSzgtOvJIFcMZnaIHz+SXgNz80WUzMA01KGgasOqe5pwLTh4Hp
    Fr2FfT7XmF027h81n7WXi7zdekffC8BS1uHn0DUN9s//NK07tT837U6JvFfSXfbMMGa9Va
    qFXL1fe9/+5BDe9RodNk4uQs7zLWHo2dVS4W2ChFlnqhw3B2XImGnevk1gHqsfFQwu/Mt9
    6j0EK7OoMPej96izC4+XWfhqpYaBbBvul8nzHph/LCbd7/YZaQfuDlsX07Xz9pZJorRe0m
    O0Pd60eN8/HQ9v1+b3BS+pgNQvo32NacOfxl39N4mIvVixXuEUfLVlQI89RVqunAtQn6Nx
    PQMp5AoIvEWbr83Cl+aFF3JhtRUfMS2X+nM9kxpTgnAFtVPTC6WIzBAB1gJuFdOuB7Wt4Q
    Qmf9dbTykakuwKpBZFSUfXn2I/QQYfApniXQHDcg0aau0j82UG9ZGG+eyzleEQjlqLzJBT
    YhmsOpDfCYgIewDu+EpqP+zXrzviXNKCrNlXTs7o2RJ3koDwh4Z0JRT1/PaQ
X-ME-Proxy: <xmx:A_jIais4EbiAp0ZTkZ4jgJTQftm6a7BzO8682V1kEMPE_0Rl0UeXjg>
    <xmx:BPjIajLFFV3NNE3XjpCk1U0pNeazWNtR8IndwEB0LBivI3X4-pq0ig>
    <xmx:BPjIaqPj_IeYVjpl6wmolfZ8RxQ4afj44aq9rz4XWjHVLTV7wkfcng>
    <xmx:BPjIamU2k6tCG6DpfW3aHTbud-rHgY25DZe9bVlcPteVKk1ezP8JdQ>
    <xmx:BPjIanY-et527lRubIV9fzpkP9ukpIFzPwF39l-LjBd0DsnRA5rI1MHi>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 10:19:47 -0400 (EDT)
Date: Fri, 9 Oct 2026 09:19:45 -0500
From: Ian Bridges <icb@fastmail.org>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	syzbot+3942dc5563ea8b96bbbe@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>
Subject: Re: [RFC PATCH] firmware_loader: fix use-after-free in
 fw_load_sysfs_fallback()
Message-ID: <asj4AS46invD2jT2@dev>
References: <ajSGzHwRxkT2rVMZ@dev>
 <20260928065053.1750765-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928065053.1750765-1-quchaosheng000406@163.com>

Hi Quchaosheng,

Thanks for the review, and for measuring it rather than reasoning about
it. The deadlock is real and this approach is a dead end, so I am
withdrawing the patch.

I reproduced it on a clean v7.0.1 with the RFC applied and
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y, using a platform driver whose
probe() issues a synchronous request_firmware() for a missing file. The
probe runs with device_lock(dev) already held, request_firmware() falls
through to fw_load_sysfs_fallback(), and that takes device_lock(parent)
on the same device. The task ends up in uninterruptible sleep in
__mutex_lock, reached from fw_load_sysfs_fallback() inside
request_firmware(), called from the driver's probe(), which really_probe()
had entered after __device_attach() already took device_lock(dev). So it
is the same mutex taken twice by the same task. request_firmware() never
returns, and the firmware timeout never matters because the task is stuck
on the mutex rather than waiting for userspace, exactly as you said.

One thing worth mentioning for anyone reproducing this is that lockdep
will not flag it. device_initialize() marks dev->mutex with
lockdep_set_novalidate_class() in drivers/base/core.c, so PROVE_LOCKING
cannot report the recursive acquisition. The silent hang is the only
signature.

The two paths do differ. The reported syzbot crash is the asynchronous
request_firmware_nowait() path, where fw_load_sysfs_fallback() runs from
a workqueue with no device_lock held. The lock I added sits in code that
both callers share, so it serializes the async path but deadlocks the
synchronous one.

I do not think there is a one line fix here, which is the main reason I
am not sending a v2. The underlying problem is that device_add() touches
the requesting device's kernfs nodes in more than one place with nothing
holding them alive, while device_del() frees them through a recursive
teardown. sysfs_create_dir_ns() reads kobj->parent->sd and takes a
reference on it before kernfs_add_one(). Then create_dir() takes another
reference on kobj->sd after the add, by which point __kernfs_remove() on
the parent can already have reaped the child that was just added. A
kernfs_get_unless_zero() try-get in sysfs_create_dir_ns(), which was your
direction (a), closes the first site but the fault just moves to the
second. Covering every site means touching generic kobject and kernfs
code, and serializing device_add() against the teardown cannot use the
device mutex, as this deadlock shows, without blocking disconnect for the
fallback timeout. As far as I can tell, this is really a driver core and
kernfs design question, so I would rather not throw a third mechanism at it
without a steer from the maintainers.

Thanks,
Ian
