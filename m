Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600806;
	b=ZuDWfDZzExBiF2qW0cmsLeWytyRbOgdgizUPkR0R1QyV2+bO2cH8NeA6AkvsUroe0EhZ
	 34pxNIvk/X9x3B9wh8XlncJGcTjNKw60lhGnbntbU/9ycIQzTjfNpj4or/6YLlhRx2y6+
	 wlFL5J8L2+dPn/AVhFp2U7vzVepXS8MEFi7PQBJew04DxfEo0TySocwxxyUBPAbX1zud8
	 y5orjyy/QVOezRR433/Hyyt/IDSUZcopx83QeXBp/5/LRk22ZfRM/4pnFDEmR43lU6yn5
	 iYskwnxXdI6vla9sEPJdocny2xuqD/CW9E/WRy+u2E8e7hCE8R9etkRyJdct5rpFoHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600806;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=X3VoFCx8PJpGcFa9PdGQhv7PDVInlxKQ0D5DE1R51Rc=;
	b=J7ltC9lgW3U/QMuO63wNwqu07bixuRcmDti/N2RqwRGs9RKgBYy4XJNNVR6ZKq616qWb
	 2oHKzMmNP/ueYgQeDdO0Pm/eoXYuhOULFTrHXIyn1ZeUNjSr3GtzGvu2uAZ4m4RAQeQtO
	 oiRE/ch7gJBS7CUye3smtCwhV9JqW39HAYVa87wJCbnLVBbb57MCUcMnrgjrtaxscyb9v
	 1glmAmAS2DUmP6KM8JqrjozRYBb+EzmxsaCaV+F1MMfkGylZp++l7fboublXsS3kbvpu8
	 B30vyHLSA7tax4f0JTUfpUvH/FJj2cE7XZdiVyndO6SRKh48muajKM7z+uzgu/JlvrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DgHrnK2N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B3B606A331;
	Wed, 25 Nov 2026 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DgHrnK2N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5B91F000CF;
	Wed, 25 Nov 2026 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795600805;
	bh=X3VoFCx8PJpGcFa9PdGQhv7PDVInlxKQ0D5DE1R51Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DgHrnK2Nc4sQPx52EHWMvpRx0vVo4o4rFQl+tDoywNUWnNH+SWiako/bHjpdVW5P0
	 BPps9MUEmDPGwR24Gjva5hsO1S2wkXtNUsnVAMLKjyDyzGhYzgY5h6/zGGVjAArjll
	 ev+BqFtz4fXqhZWlG2eNzsK+FMQ2I2BN8y32jngs=
Date: Wed, 25 Nov 2026 10:59:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ruide Cao <caoruide123@gmail.com>
Cc: Ren Wei <weir@nebusec.ai>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, rafael@kernel.org, dakr@kernel.org,
	johan@kernel.org, akpm@linux-foundation.org, kay.sievers@vrfy.org,
	vega@nebusec.ai
Subject: Re: [PATCH driver-core 1/1] kobject: reserve an envp slot for the
 terminator
Message-ID: <2026112518-dynamic-trustee-d86e@gregkh>
References: <cover.1795426787.git.caoruide123@gmail.com>
 <cd35c5682ebe0f5a58fa6beed90bb7d0e7d5e9a2.1795426787.git.caoruide123@gmail.com>
 <2026112301-jingle-multiply-c72d@gregkh>
 <CACveakTAopfuvAVQnbzzU3c6z2efTgySV5xo7330KAD6nMSxYQ@mail.gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACveakTAopfuvAVQnbzzU3c6z2efTgySV5xo7330KAD6nMSxYQ@mail.gmail.com>


A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?


http://daringfireball.net/2007/07/on_top

On Wed, Nov 25, 2026 at 05:13:08PM +0800, Ruide Cao wrote:
> Hi Greg,
> 
> You are right to be suspicious of this one, thanks. v1 was not good
> enough: the "- 1" lowers the limit for every uevent from 64 to 63,
> including events that never go near the usermode helper. In testing,
> a currently valid 64-variable event was rejected (with the "too many
> keys" WARN) on v1, on both the helper and the netlink-only path.
> 
> The underlying bug is still real: when env->envp[] is completely full
> there is no slot left for the NULL terminator, so with
> CONFIG_UEVENT_HELPER the helper's envp is not terminated and
> kernel_execve() walks past the array (KASAN: strnlen <-
> copy_string_kernel <- kernel_execve, then panic).

This is an ai-response.  {sigh}

Please do this work yourself.

> v2 keeps the 64-variable capacity and instead adds one dedicated
> terminator slot (envp[UEVENT_NUM_ENVP + 1]), writes NULL after every
> successful add_uevent_var(), and also after zap_modalias_env() drops
> MODALIAS. struct kobj_uevent_env is kernel-internal, so the only
> visible change is 8 bytes.

What does this mean?  Again, think about the problem, come up with a
valid solution, and write this all in your own words.

thanks,

greg k-h
