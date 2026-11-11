Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404498;
	b=RhLFyoYHTPqEQu1t98HGjH18+qO1Ih6HKET22gcugNtYxuK/evomDcAkTgg8zoAGy/0P
	 TjvWpiVqWGutCuI71DxoZIukoDk0n7HSCG7Mv9kfI0ax4oGFGEZOFZV57m90oO9qFy1tf
	 c8PwalagcE5rDf9PE3rpXLhZZTxg3KuGzdJPcyS6C3Keak8pW3HzetxBeshqaPrvgQpn2
	 e5W4+TuEXYh/69tWI9JZ9hjaARKNzSl0dEex2NzaRTPtbxqXhC3h3VGo77GrlQVZxB3sf
	 tLZX/fzn2ykIlw7mhw5XqJTZEm1W5ba+1dO0KjON6SmaDEYJBS49+th6a86ZJWjqp4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404498;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=lBNxRck0sagxRQGTzKp7MHUYtsYXNZUwRLR8qck3nLM=;
	b=uQyPI2fjFll3DKpdAM5+Ju9MAtxLky/Mof/nRmsT72iidLAIbDzDYJFRxHzc0rIldqBp
	 tiHZay7m/Kh9uYLkkhH5wqpqG6+2sAXkjiCxMC2eP8r99BxiLRIm23PNhx0cc6FMJnUcZ
	 8OlVsbRl2HyEDP4M0OpyO//V+cHt41NxqQEUHWu0njx2W6XAuQJlDzRXCIkD2/s9gVth8
	 HoIYI/7Avbz34BcMqqE7MCGsWsx43WdoKgjWkHe4RLsOPmIQbBwIfCcHSxoKVFW0b6Dv4
	 v5Lu7t+YeuUPBZp96tsLV9bVj8fyPn6BSA8tZ96mEA5XvrbUYxfTTWRHeRIvzqxhn+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=akQ8hHrG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C9D606A324;
	Wed, 11 Nov 2026 13:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=akQ8hHrG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C9A1F00A05;
	Wed, 11 Nov 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794404497;
	bh=lBNxRck0sagxRQGTzKp7MHUYtsYXNZUwRLR8qck3nLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=akQ8hHrGyNORMns1NGnZMMNc0fe+TW7gcZPw+smeNHyiaTqCVe8aB6W73Wt5Y+Qyv
	 1kGNUjadyfGW2JMhNQtCNSm69ER7COh66Vtk47SxML9d9+ReSWCHpfP2kHbzp5maYM
	 W2ZZTcrDKV0acgaFD+GpaBWpLePH+YGiDMJGRKXA=
Date: Wed, 11 Nov 2026 08:41:36 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: tj@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: kernfs: kernfs_drain()'s fast-path decision reads the active
 count without acquire ordering -- on weakly-ordered architectures the forced
 ->release()/unmap can be skipped
Message-ID: <2026111106-blurb-mantra-4b92@gregkh>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <61919bed.2429b.1a1c983aa11.Coremail.xuhx@hust.edu.cn>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61919bed.2429b.1a1c983aa11.Coremail.xuhx@hust.edu.cn>

On Wed, Nov 11, 2026 at 03:30:11PM +0800, 徐晗翔 wrote:
> kernfs_drain() (fs/kernfs/dir.c:508-551) decides whether it must
> drain open files with the fast-path test "atomic_read(&kn->active)
> == KN_DEACTIVATED_BIAS && !kernfs_should_drain_open_files(kn)" --
> both a plain atomic_read (relaxed) and an unlocked read of
> kn->attr.open / on->nr_mmapped / on->nr_to_release.  The writer side
> (the last active holder) releases correctly -- its writes to
> attr.open/counter happen under the hash lock, followed by the fully
> ordered atomic_dec_return() that wakes the drain waiter
> (dir.c:491-495) -- but on the READER side there is no acquire edge
> on any fast path: the early-return branch (:522-524), the
> wait_event's non-sleeping first check (:537-538), and the slow-loop
> checks where the waker has not yet touched the queue lock.  The
> phase-1 BIAS add is itself a relaxed atomic_add (:1563), and the
> kernfs_rwsem write lock the remover holds has no intersection with
> the putter.  On a weakly-ordered architecture (arm64, powerpc,
> riscv; x86-TSO is immune because plain load-load does not reorder),
> the remover can therefore observe "active drained" WITHOUT observing
> the racing opener's attr.open/nr_to_release/nr_mmapped updates, skip
> kernfs_drain_open_files() entirely, and leave the mandatory
> ->release() and unmap_mapping_range() to be deferred to the last fd
> close.  Consequences under current semantics: no memory corruption
> (of->kn/inode stay pinned through the dentry chain; the close path
> performs the release and decrements then, and the accounting WARN
> never fires) -- the observable effects are a delayed
> cgroup_file_release()/put_cgroup_ns() (a cgroup-namespace reference
> pinned for the lifetime of a leaked-open fd) and a skipped
> unmap_mapping_range() (mmap'ed vmas survive until their next fault
> takes the kernfs fault path and SIGBUSes, safely).  I verified the
> RACE itself dynamically on a stock Linux 7.3 KCSAN kernel: a
> cgroup2-slot hammer (attached) produced 17 captures of exactly the
> target race pair -- kernfs_fop_release (the nr_to_release--
> writer, inlined in the close path) vs kernfs_should_drain_open_files
> (read), with the reader stack at kernfs_drain+0xba, which I mapped
> back to dir.c:522-524 (the early-return decision) via objdump (the
> cmp $0x80000001 / KN_DEACTIVATED_BIAS immediate).  The consequence
> itself needs a weakly-ordered machine plus a microsecond window, so
> I did not and could not trigger it on x86 -- the report is therefore
> a memory-ordering fix with (a) the race pair proven to occur as a
> matter of course on x86, (b) an LKMM litmus showing the outcome is
> Allowed on linux-kernel.cat and Never on x86-TSO (available; please
> run it), and (c) a one-line fix that closes all three fast paths.

<snip>

This is a wall of LLM text that isn't useful to anyone, sorry.

Please just submit normal patches, as our documentation asks for.

thanks,

greg k-h
