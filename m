Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C43A875D
	for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437424; cv=pass; b=ZDCp4OJFIsr4x9jD+YLXwAEiyHyLVIGdMtopBdrkL3F0onG02PHJYldlMIyfBeoNhfoSh/UnbRQrflVQozQlySFXO9usMQ8OBiJJrdclgNDEaq41zwRczByha1pCCuYYBHiD4XR6mulfzhbRChAVFEucCgmGeu8RdHUA6UCoMxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437424; c=relaxed/simple;
	bh=ay21lQKV5tuEq9HfBoFBDqkqsojoSvd8lZWA7eQUB1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZKusHNO6QOiLd/V9WYUrE7Xnq1E4q647Pu49AOAs/JSFUCmFpqtzFzvuXh1VQMZF8TQg0E7VRhO0XVY/Vf1WqHzVlM4f4ty8WQ9zwVvOLzu8HNStJGN4McmDmDpIyHQeizgbC5Qups+3BcVIUHS7CFET8HeEpIGgN1V6rfLGjSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pykdERv1; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pykdERv1"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6714fa8b955so1389278a12.0
        for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 07:50:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776437421; cv=none;
        d=google.com; s=arc-20240605;
        b=NV5FLI9UUm1O1zphGUaQNiLyL3G7mBgGZ9Rx/BAp5tmXlHS62UwV+5i0LMnG3ttNw2
         5lHZ1feqL9fMmBG1DWWHdIQvEzWXVmd09mrWS45U7oC8IIbdmBD63SeUrrJXOADV4eQw
         olcAQKtqz1KgNewpesUW9mjm+jJOl1Icn59nS6IswU73VMBQyfZv/Y4JYv9Iy7DCS5e9
         MQBa/uVotPHgwKcGd1PMwDjifOWM1iuXfrMHSrlkFwhvnq028uUmePcU9r63F5D9nCTT
         OuBO3FeMeJxCFIT7d25MPKKxkAt3JzUstg2O0LmW4+ubJLVdiiU2eOvcV576ZXHOTe3W
         qqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JS8A9A7V61KfLyBBxPS5o4cBzMwrrhKRvFUssDGUCCY=;
        fh=OUUwCQGAPSyex5SR/xETsUpf/uQgmZWNIe1PM6nKO0A=;
        b=Q+7NTL0BTFQpGck1y65qOS0ShZLzl3ieOfk1+DzjYfnVU3WXqBUfq+3bRtzsc6IH/V
         XMgH90A15xC6nQ7Cqd335hQ9QVER6+ogpcmNeoyIglP5bB4ffgeGqGOmzLk6wbPi9Xgg
         IzIzXGmU1WzftyHiQq8r2l05GsX00vlbNXqJQNhBjbu2bdcgvGiTdGqqsoKhwIE0XZGE
         Idj0jtFxxuZiWfYX2cKuasAfsSy6+IsbKRX7gqcW0IQZmRxS82rgBSO0Xr9jen8mo7Bp
         rFtbIRVlNkerDc0v9YfNNcEeb2/0/tKedtdrADfq0mo0ao+RfoVwSx6+olEBkjyVmgDo
         n9ZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776437421; x=1777042221; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JS8A9A7V61KfLyBBxPS5o4cBzMwrrhKRvFUssDGUCCY=;
        b=pykdERv1j1QwrtTqt+N7O/SZwDQawvFEZWhP5bdbk2EEQhscqSZyjvtgZF+Dl/1DJT
         w7GGfWiaAcoSy9gtNE8Ei8GHigcJr4T0QjbervWB0ST+vKAYDZJtb+CPHEMklTr7YWFr
         8BeVx1evRAgrsGIEACqH0HgjVaOL1JJ+ZHYxOSGgk2ETneVubGWpn66RGvdiifmHSSZw
         gGh1dKhdOm3E/8Ju/4U82OkrWi4oL2aXizn8105pxm0xkyb26tc0HE3Cl3jtGS3N7Xh0
         VUOftpVfJ3ryQWxgY7lPpMpPSWGVfJuZJ2KTTnjjjrMYkq28Xk0b015hpR9DMbSEC9tr
         o8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776437421; x=1777042221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JS8A9A7V61KfLyBBxPS5o4cBzMwrrhKRvFUssDGUCCY=;
        b=RRq/EFTFHNMLPxgyBdErmthmpbX4tvAS9Q/8ooV7EzxiSto9Sv1WdbyNx9k+Gld1He
         0dwxf0/DaAqBGTqVR078QlpKf6eCi1IG2EsUza47Iq66R/x3nMGU7GMHSeplfaZsIwPT
         U5iSB8wAqqaElBVFQQ39tYnil4PdR/rX1c1/8jJl8upxdwuP9T4s5OouhqMfD0CUZa4S
         Q7tSaA82UpzkHzfawcnwNJ5qqeJo/7LMCdPNFeCGmPORbo7jBGt/yhPSKoEZWVG//UTb
         tzbuByl1AXyFanGn5WS63rFWyGf+GNeUCDl8KsubJ6kvEKgZjFUknZo2WBFjNJEeK3M3
         2kxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DTEJaRpXO6lnJXeRUz4tj3pbuXhpXbNUu7gzjA/X/utjvBjxjsE67U2Y+LLlrvmzNoAXs3WfLlm3GAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQeqjFCQX0maukgiAxZKPg2DL37/a9X/Vg1z3AAUKGV9FaJlrt
	FZ+1dxNgA9JNVrAxA2pUc07upv/aw3CbbGZm1accGjn1PPgmWbQuy4tLirXad5BeE257GDwkTpT
	RWCo/hqbEGp0+9VG3Nlg0RMN5LNrXDAM=
X-Gm-Gg: AeBDievJZDKgoU1CzY0glhTdsbvnjbNl2Ayw9k1caew4PLh0yWg3zB0tZ5syaLArZom
	WAxwiGXQEgnGQqdfOnB6H3BuibKDOJRFy8WoTyI1ljT2MRTXypnQMmXTro3RSCdRXvvvQFnbVjr
	+gHTMpUzzylEQTXnS34kPzGCxBXyuh1SVKtp+6xSPijb7pR9vsvC9TgELje0KMsxyBOFZLfaSSb
	1udY4pbtI3q5Hdft3UGRKyjd6a5rB8WxwxUIBhtwWBrabxZp6rh7VbGDpRfWASyXbMHNWa27oOr
	Nkx2z4MMMGURJ/PX
X-Received: by 2002:a05:6402:2792:b0:66b:582b:720a with SMTP id
 4fb4d7f45d1cf-672bfd85cd9mr1538946a12.3.1776437420670; Fri, 17 Apr 2026
 07:50:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416235630.78408-1-dbgh9129@gmail.com> <177642405980.37967.8507961006938952945.b4-ty@b4>
In-Reply-To: <177642405980.37967.8507961006938952945.b4-ty@b4>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 17 Apr 2026 10:50:08 -0400
X-Gm-Features: AQROBzDi-O3QXd3OCXlOFy93y8kDzCdi6oiyXRgU6I2ynIy1EDYZVTXhj2zbStk
Message-ID: <CACrCO_WUzE=vW2dPJ_VEzYtR=LUeB-rNHLtcw58eh7HJN5cKwg@mail.gmail.com>
Subject: Re: [PATCH v1] regmap: ram: fix memory leaks in __regmap_init_ram()
 on error
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	"Kim, Taegyu" <tmk5904@psu.edu>
Content-Type: text/plain; charset="UTF-8"

Dear Mark,

Thanks for applying the patch.

Best regards,
Yuho Choi

On Fri, 17 Apr 2026 at 08:27, Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, 16 Apr 2026 19:56:30 -0400, Yuho Choi wrote:
> > regmap: ram: fix memory leaks in __regmap_init_ram() on error
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.1
>
> Thanks!
>
> [1/1] regmap: ram: fix memory leaks in __regmap_init_ram() on error
>       https://git.kernel.org/broonie/sound/c/7e555fcae40a
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>
