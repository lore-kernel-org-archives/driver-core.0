Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600809;
	b=DkZsbupQyGQBR4HSHmtlubh/40wKFxVQHMs2/1Yqr8sGH94Z8g5kcNvgcBU6M81nUARc
	 WejU7dFro0EbpwG1fI0dMzlxxo6k50cCJYPZ2kHZhiJuzobY8JvIpXUW1E0tx0G7V+qRP
	 NSu0wqpvfFmNaoKzfTSVeSjK6COyWgAsuAG7GtssPq2p32PBBLt0l+qTTFDbzTXQCPbjF
	 4RhE/yZHpX9SjSnXVJIKuwd4i011swH3NMLT7rhjEqRcV7KDGqsrC6+KB9PuM+BbGJuI+
	 fAxnDHaI5rR35HhP/puzmAjIHdhdlyeNzr2OZHwVZIu/0AKc9HGALY6G7y+MuGhQ0pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600809;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6XEY/5UNTdET1ago5mcIAs9GRKA4D2xpcpHWI8rlZEU=;
	b=3mWeRzbGa+fbeQuYpk5No58R7M5uMsITnjlvIpDLpNd0bkO5E5mmsatoh848V63U1SN9
	 twheUET0ry7awNX0mV+n5x3kX3cFPeIWtz/tBxA+fAKnouS+fZTJz6P/QnXF7vjHkGazQ
	 zUCk6KTO/ADaA7yzxcVf31ljPvBqCND1WMlD1Y6OnP0Q68gZ17AQuCQI3SVtHGkx432SN
	 rptmY0EGF/N+7DzlRNRk2fgqLxcDDB2KtpYlbz01lXwBNBU80Te08mcvP0SlRzN/1Ikff
	 Rw8nvIjlOdqOtNlKtQsMsGoCJgrHmGs7yyKLOKOiJovA0W2nMeiI2C4rhmC6iXJZ3Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sLIMBY27;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF81606A680;
	Wed, 25 Nov 2026 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sLIMBY27
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F7A1F000D4;
	Wed, 25 Nov 2026 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795600809;
	bh=6XEY/5UNTdET1ago5mcIAs9GRKA4D2xpcpHWI8rlZEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sLIMBY27tP2BNwxfpp3V6Nzk0btbUqWVVqDZhfb0SeKMHTqG13/u8K87bYJPf/Prd
	 20IzPR/ZPTblAXnQfFc7dyAg9TsZMaPzLNSq5dVrhOk8ZUx0hS3qhwx3eSpxdE+C9G
	 0BakdYrwpC4E2nLL3uWQz414K+xLcbVkjlE/ZWEA=
Date: Wed, 25 Nov 2026 10:59:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ruide Cao <caoruide123@gmail.com>
Cc: Ren Wei <weir@nebusec.ai>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, rafael@kernel.org, dakr@kernel.org,
	johan@kernel.org, akpm@linux-foundation.org, kay.sievers@vrfy.org,
	vega@nebusec.ai
Subject: Re: [PATCH driver-core v2] kobject: terminate the uevent helper
 environment
Message-ID: <2026112521-anywhere-abacus-249c@gregkh>
References: <39d1eae0d7c8b235f5d4b68d94205b70832ab786.1795506878.git.caoruide123@gmail.com>
 <2026112516-germicide-viewing-3a9f@gregkh>
 <CACveakRWUr73N5WZ4a=07QQdiK3+=Ct=BSB89TS3wnx6Yen+kg@mail.gmail.com>
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
In-Reply-To: <CACveakRWUr73N5WZ4a=07QQdiK3+=Ct=BSB89TS3wnx6Yen+kg@mail.gmail.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?


http://daringfireball.net/2007/07/on_top

On Wed, Nov 25, 2026 at 05:40:04PM +0800, Ruide Cao wrote:
> Hi Greg,
> 
> Sorry. We took your comments seriously and did not mean to skip the discussion.
> 
> I wanted the reply to include a lore link to the new patch, so that
> you could look at the change and the explanation together.
> 
> Going forward, I will always reply on the thread first and only then
> send any follow-up patch.
> 
> Please find our reply to your previous questions here:
> https://lore.kernel.org/all/CACveakTAopfuvAVQnbzzU3c6z2efTgySV5xo7330KAD6nMSxYQ@mail.gmail.com/

Ok, let's take it there, and PLEASE do not just use AI to respond to my
questions, that's rude for all of us involved...

greg k-h
