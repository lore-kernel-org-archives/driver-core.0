Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2293E8665;
	Mon,  4 May 2026 18:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921188; cv=none; b=F0nnIZbmZhPb30MEtHB61OvvZuW0XWDAiFUYerYtjCVUWVExEYHNrZdOoRZttpRqa6FqtPC2Uo/ewq91wxO+drY2hAppqHIAkyMUK0QGTVlYb4ZZhcbTiAc5WTWorr8INErUI9HakMQJpnpZyVfC6dBHhhbEhpSTGsULLrC9AIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921188; c=relaxed/simple;
	bh=Pp1385CD+MwZURT7RFCXa/NgKqrQ6O8DfECDgomzfF4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=i17O08rs9okS9RQzBTfj8+vXiiavCIyAixLVGvp/Fw7Jd0lJ6XL6G4/SIoTAWBvqpFCBNo/WorjknWLfmzCPXSQr4dBZk9K2NgfvTybykFmQDRZz5Tstv5oN36Pc72eZl8e1Q8vUSwaR1mkAmNZ6IZ7jAojZnInfXymGABkr8rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esoeQ6UB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esoeQ6UB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1E8C2BCC4;
	Mon,  4 May 2026 18:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777921188;
	bh=Pp1385CD+MwZURT7RFCXa/NgKqrQ6O8DfECDgomzfF4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=esoeQ6UB/5QJbtAOaHvmNj3fFiryy7v/tqVdm5lmbPl7bIV20vny92IHw4SFehW4W
	 Mi5SgcHr88j1vWp/OS5F1/5cnvkVZHrztU69/Vabq+qzCF6tC3MA9eIc2v7BdwEBhq
	 iqR6u7wHkyrDhbmDy48dBi5jLF1WZv3Ktrya/tcRuOp7mfig1fDwkSzIc3a5YrlAk3
	 xIIHFP5uzHwOVZtGuIhVyU2HXXob8VuYnJ8h1IpXKksUDWUuSLL0byQTy73ubY9kSj
	 8fe2ulAqi14X8llYF12ginv/CLK+V1wfl1HLfKLro+7c4tY27t7+uFlBux+C+uUYvQ
	 KolTZFzYafdHg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 20:59:45 +0200
Message-Id: <DIA4GKZMIFBT.27APOZ08MTDPX@kernel.org>
Subject: Re: [PATCH] driver core: use READ_ONCE() for dev->driver in
 dev_has_sync_state()
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, <gregkh@linuxfoundation.org>,
 <saravanak@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260418162221.1121873-1-dakr@kernel.org>
 <CAJZ5v0jkm9K9=-U_51FMsyxN2msdouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com>
 <CAPDyKFo9wcxLnCdykwE9J_vevBtjq7UVL4Yq3M=MOZ8M=j6LCA@mail.gmail.com>
 <DI9TMWIP69JZ.3LTL282WBVCOT@kernel.org>
 <CAPDyKFo6Jyq+VTVvrX=DkQoxbGVi4cunvsNYya6oyz7=OZY6BA@mail.gmail.com>
In-Reply-To: <CAPDyKFo6Jyq+VTVvrX=DkQoxbGVi4cunvsNYya6oyz7=OZY6BA@mail.gmail.com>

On Mon May 4, 2026 at 8:43 PM CEST, Ulf Hansson wrote:
> On Mon, 4 May 2026 at 12:30, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Mon May 4, 2026 at 11:49 AM CEST, Ulf Hansson wrote:
>> > Apologize for the delay. Genpd needs the function [1] when it tries to
>> > assign a common ->sync_state() callback for its providers.
>>
>> Can you add a revert of [1] to your patch series, so it gets (re-)export=
ed with
>> a user?
>
> Yes!
>
> I was trying to avoid dependent changes to the driver core to funnel
> my series entirely through my pmdomain tree. Anyway, perhaps you can
> host an immutable branch for me to pull in, in this case.

I think you can just make the revert the first patch in your series and whe=
n it
is ready I can pick up only the revert in the driver-core tree; everything =
else
can go through your pmdomain tree.

I.e. you don't need the revert in your pmdomain tree as it should still hav=
e
dev_has_sync_state() exported in device.h.
