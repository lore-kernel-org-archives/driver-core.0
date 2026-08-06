Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474D64B048F
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 23:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786060301; cv=pass; b=l6DW4OPGCgaVxbjqBJ7VD8f8hX4OosjEUwcpMK/vehWRodENxOOapQzQXQDxu744t/m8Sld1wFXq/OULsECsQsgHcLLmgOyQlcwoxrxqoc0VlxP5rSUlRYwG3HT/LoqrYE7xPsYeM0XrmHF7/o2v92xBZcnbif8EZiUjJDBpBxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786060301; c=relaxed/simple;
	bh=9ApL3yvbJJoPDqNBc5nPKZMb4VSNnNUverpXTK53g9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVJe6ENB7UQqGeZSJRQkI3o8gyp43cEVikhS+C2pwnHZiq8eNoYJWKSJMh3qZJapn+1CYYzzVwxkcOD/uRg1MT7RsnE9daTI6X6n/abnIJTa1WkixMV+BuwazSNrzVsEx2ewxgsY4H4BWXOeDxvu+qCCCpPUP1L8cAXToMmtaI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2LdQUtr; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2LdQUtr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so456351066b.0
        for <driver-core@lists.linux.dev>; Thu, 06 Aug 2026 16:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786060298; cv=none;
        d=google.com; s=arc-20260327;
        b=rZIg99JDaSE3E/UCGl3IGXPBgDQqHTNt6vWL0XBjefgmPxnqkrVhM4wWXqUfvV+9sJ
         P8sbaB6Jkj/9qwFatIxXy/J+BsTKe2SJGEdXowaojOHCZCtJ2WLK6koSOGAxucHBtQsI
         3BE/mcnAmwt8SF0vDu2aL6zjQ7+ATMfoGY82n0pttdrwB6V5bxmIMvXW1tf1Zyu8X8HL
         jTtmejfjJipYfw25C92bgSA6py+m8FbcSWjh0Q4Y7/OpZ6ktvdHN3CC6i+XNG9yyJSWm
         ZmtgOxbF98sfkalqJw/foo6/vdNOfUjPnL5oVtCtm0LO41LnhTu4KX+dVg3oNRa/BJY6
         yfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9ApL3yvbJJoPDqNBc5nPKZMb4VSNnNUverpXTK53g9Y=;
        fh=t6x2qQxJcBOVAv2WfMg40r2ge17MY2OtsCA5olkXKII=;
        b=Ae0Wrfv0wo1W6D13E3p3tjbzDx8VNCpgaP0e9g/6b61kUscLOI2gn6TApltARuYjcU
         5UXlVxWx/VZpyvTC4ulDS1TGFe0DywjTunyBFrpTbwk6ujCgyye2AD11kcL+VxJzd7cP
         aLYhv514YnzOTYWnUheoSfm/7qdz4/l8xsJPOBrAjn9pL6LLt65ntICCayhQEUFZz2cD
         tMcmWXLNSKhh6uWAjIsPI/I9dPZjyCCeViim7unZrImIxL3IPxBAVnl9ylIfZoy1sf8p
         LiPpljob4tRd2XfGCtSYYNAQjoPkczFPIYmEX12H9SvWd1yDidjmfJuBgCxm3gk2CUeN
         D/xQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786060298; x=1786665098; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ApL3yvbJJoPDqNBc5nPKZMb4VSNnNUverpXTK53g9Y=;
        b=K2LdQUtrowMk9K82lNOxF5uEOT9hqo3A24uENMumrcm8LeOkS7v/0alBlmnawxkMSk
         r1tsEvXk4/mE6lNcMV4/JsppJHEhou1GHI5bwAHng8VA66wem7kJfNcoVejRS+ZElQ7y
         PcEpFNybFDebTpVkfZUCA9fdmzTuusf1Neo6OKY+Sj01+w3DTWibbFvJT845sXPkfbTO
         S5UvxiNokEpEikQdKLRr2VHZZKdMaqR7TFLEJdMp6rU8Faz1aXJscm7R/GO/5TJNkQp1
         M0ywQfrmbWmgh1rv6juHbIMDAfs5/SYkjvC0rmv+XxRHhAewoA8DlSCApBFrkxKgPTM8
         rMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786060298; x=1786665098;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ApL3yvbJJoPDqNBc5nPKZMb4VSNnNUverpXTK53g9Y=;
        b=Jl0KZiqNymdJauyLY19gES6GajBzyTKLOlC9Uy/TAJsf+OblmpFSwFL2prsXqQbubv
         s31EMKInXdvhefmIVlqJOwY0YnG0pdZYMeLZlbnrkrZXcgG6Kulqh5BCZN4qDIDIbfiD
         ob8f9AmLB2b/spN23mgyOIHhcEurF305DjWnjWwIzL7cJMG6kfjCqbME+8YK4sR0Rczh
         1fqoaQGDyLiuRufbPS+uOuXDxQOzG2aZJN+zQ511fTL78qswKdPnPhiCfCwvpQZ3k9BK
         5wSPoMkuSHkGxytzSd1AFeREXtz4S14mUYySzpwdiaNwCpbwYPTZZzuIZJl6vHlWvZtp
         1k8A==
X-Forwarded-Encrypted: i=1; AHgh+RqULHzEpwSIQkoBHz8LwB1jDIILcMpUFep6LYtvxiJsW3VSV9Insg7PmwDmR4IqS+6bY2BpiNIN3WpT3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWuzWCf4gLQzA9m05jWBLYzJx0MCDLzMKMRPijHQlY5MTA5JLP
	zPoRmWB1BhNuKWMSkUprtVJvXVstTK+Sw3VlkvcAevfPDQHOtO3TUcW/zj6BzpTB8GcOMBSr43g
	Yom8cVNoD/cxmiyU80a/e75dWjyou4Bs=
X-Gm-Gg: AR+sD11xH7aBy7lFE1E3vbdA+A2IRFy6+KYlEfOkoMurG+qscvGfc+s6GTDVRHABhMA
	zuseWTEZs5VClDl13XD0dvK+nyTkkvefn9fW9PfmaVzS+S6OAkANSy6tmyc4ds7lPTdrYw7QtFx
	GmZTkpalblApPJy52vP+x5FRIfxGC0Sfnr0HqlUcPAsEpJsReXLp+O/ef9Q62qwLJh54ZKABnm5
	VIFExmjQ/+HCESnpswKzi8Yackh6ONOQ1lI/ObFq9NBQdSuANRS6wghpzzTy8kfTAw6xofaXXdx
	S1E+OCFfUrocw4/aMx3a4yCncJP8v5HzryJhAoTBjLeFSqtfCV35YoTt1cieS0RZYuD5yK+h4PQ
	Y/t0yTMjJ7g89pxgg40VjdsxTb5U=
X-Received: by 2002:a17:907:9301:b0:bec:64d4:3872 with SMTP id
 a640c23a62f3a-c2039ec8d14mr800060966b.24.1786060298177; Thu, 06 Aug 2026
 16:51:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803012941.610268-1-dbgh9129@gmail.com> <DKI6VHVGQVRX.3JWQYO4QAPJC3@kernel.org>
In-Reply-To: <DKI6VHVGQVRX.3JWQYO4QAPJC3@kernel.org>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Thu, 6 Aug 2026 19:51:26 -0400
X-Gm-Features: AUfX_mwSBb9X-7UvOW6ar4fqMPQwM443KD6rJinu9CP2SEGBDxjl_e42b-N3_kA
Message-ID: <CACrCO_XKqZ=tgfnpD6uVxTG2=PMJd8g0hPXy=BC-ma=-Ae7wPw@mail.gmail.com>
Subject: Re: [PATCH v1] firmware_loader: Unwind initialization on sysfs failure
To: Danilo Krummrich <dakr@kernel.org>
Cc: mcgrof@kernel.org, russ.weight@linux.dev, gregkh@linuxfoundation.org, 
	rafael@kernel.org, nixiaoming@huawei.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Aug 2026 at 17:46, Danilo Krummrich <dakr@kernel.org> wrote:
>
> Those are two separate issues, so it should also be two separate patches.

I appreciate your time reviewing this. I'll send two separate patches.

Thanks,
Yuho
