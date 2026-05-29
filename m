Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01909233954
	for <driver-core@lists.linux.dev>; Fri, 29 May 2026 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780096615; cv=pass; b=Sn6Am71eiygadpxNwegIQ6ZVyyU5rg1c8JwAMMk5u+3ssfRsxEmVY76n4RgB9Rd6dbzCnpbseabBw48AgmBn7rbgxCeWDbX/hhPISHa9Y+zCIbO2EEkbgJY1Mm7bV5mbnEjpv7GH1iS2tEvh13QHJCz8Ma7yydbPZy8MQolnlfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780096615; c=relaxed/simple;
	bh=5PPmBl8iZv83rKS6DWMFHdd3U0I2/OieYkLHDpNGe5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9y3BF4ZP5rTDON9Mgk3GTkEM9AwLhQw0XIfTYpp767tczjoyQy6Ob9K44pTFt1MyBfRCNF+Uti2xi+92X1nnF3JKC86XUGh/+rV4KJAHlyxR7tiKmWLFbtTWAhsF3FYKn+IHvjDwjeVa0Arbesw2xEnu844jG5+YVE2g2NdVAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xw31VZEr; arc=pass smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xw31VZEr"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-841f722ac93so709849b3a.3
        for <driver-core@lists.linux.dev>; Fri, 29 May 2026 16:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780096613; cv=none;
        d=google.com; s=arc-20240605;
        b=eIji18WUfPpIwktrq9w1vMRSrynPmnFAE1OtXVXrtWdP0X9R5Ru+9mKS6dv0mGnigS
         aoxBsNzW180vXaQF/OxEHWoTaWTpYkqCK+HiPMA4p1V0RItOPLg3sgrjN69wJaeJm2kJ
         9Yfr/DQiLs+SC6Tc5/Bb+20EZ8YJakXRjYcbSgCcM30hS5cVumt7HsOg1clvGYTpAGzR
         da5AUB83NKkRasLkGP18D1J6e4hSXSAyjArzfDZ19QYrQbMLeWnv4Kebek+o3qZubIWh
         7rj5VZZ+7fEmgD6919zNiD8RcBDEv3RWtkHxM9KfT2fU57g5dIWKR9CxDXtmN1lGwkkn
         CBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5PPmBl8iZv83rKS6DWMFHdd3U0I2/OieYkLHDpNGe5U=;
        fh=tQayiRoje0rnAzjTS8uqq4Nm+tioh9GVsnMp858WF3o=;
        b=HjU3OFInOM4bxSybx9iy8B5D+8Rfhhtezg+qRXJmBPkwf2JQ7y07WtPAV01PPrKbkr
         nKZzvsWZDLXZh84855KFFL0zJVQxeTB04amG0B2DXfAuwrn6Adfrp6Mv53FtelYByS34
         HXMY9Enya1HfX2dxzhGW2x5JCHZASjLsxbplBSFwY+j2Yj0KnrLR4dMC5aT6eCkojrkC
         +u8KEvI0b36l9PUM8BqvHKapm4Xf5+lY4bgJW8F3wZPhgU7DzE1L5IJs8dm94i6tmjFb
         jy25Xh70uQSGz/M7O8noIQhblCxczxk+SZLa9GgB0xxNQvAAuDro9OzVF4XtKb6+85bv
         DK1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780096613; x=1780701413; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5PPmBl8iZv83rKS6DWMFHdd3U0I2/OieYkLHDpNGe5U=;
        b=Xw31VZErAHLsD9XQhZ70fU2WXTQjyD61upGaaUz8TK+x8HW2Z1NWhSoS9QjPRA6pWB
         5aQwonpyFWI2hRr0lX+Wm9xX+Q8cYVRVLdo2YuSWVbkN2l97KXxhTMcyh20n1sPhUIEs
         GLfrRNljTTnm+D2M5okwNEWb0e/AUXWZ3OD4WGxT3qaVhDfRoHrjNkxETfpc4XQeRby+
         76tftHIXM008FICIkPVsy+QDOWQ5IF8MwgeI9YJG8AoxLazUaufEKVhsTEd9ttdZ+2S9
         7hNDcH2FkEMwDGVIAYSABAXiRnhi+IJG3qc5LCAtI4NShhxfut2V7YYikZns/TGO8Zzg
         uKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780096613; x=1780701413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PPmBl8iZv83rKS6DWMFHdd3U0I2/OieYkLHDpNGe5U=;
        b=i/lLgBBHA99rV2XChg/QOsktrlHV5fqOoYytCiaTvqkHxmYI8NgXVvgfhxkrCC0Dhg
         GsUdXSy4xyyy+KrIr7pLU/qJQzYzZWe6GnjiqzJfMLQi+hgMDdA/HBzkktB9CMSAGkgv
         4dP/bw+U81z2DJTY3v9PhvaMjb1Ww1fJhAyqGmZEIrnLHZKxkqoqQYA+ojB1gVgzXTL3
         /pLYr1e9krO2xs0AbjS21P3RnZ+M1a4miMR/+NXgoqzQn16GAYdknPXVbdpAJuUjlGKL
         rfx/SODQP9y33WFpKWQ3BR4iOZa5vJJqVeDFTJBF9WeNi2F8zHdgZY8iptAzFYt9k/rY
         AaXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9V++F0l/d/2O4diDKx3PuBoaZInd1xIhSuC1wyO+ukche/EjJ8GN7hMsJVcKYWPnSS9QCiaDDQYDoPTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZSF3KcviETueB4pkqQxO9rtzRvdAwI0ztYhhfeERYgFW6nJoa
	peUsORz5H/sIKEEfPAEnFGJ6hNDeAjksgKV0PBFoXPqO8acPfgw9sX1iiJhpBhxmswBHH5MyZtp
	rHLz61lmij+AfRNOeNk43C2IljUMvxoQSCrFy
X-Gm-Gg: Acq92OHtnIJTUxpDViGhuMmtYOSulFfvO0qTLRqCIweZ+UbPxIeRpXs1mGuNgtlFTG/
	AU0sJnBTpeYuS4gmlx+zLzFa4ouwWBAKZ7BEoSUQ/tN8K7NSqbeJv+cZcx8/0T8KUChv5grjky+
	1wxP39DAXeC4xJ/BIRIeSdbGzYXDra/4hGbVC+FiDmrLoHQxXxw03r6eMrHxfRWrVnnio5VS8gN
	YsPj7UDv5Fuhxxc0fhxWZLhCzOxqxSpYdhISNKwD0rfY/NznDeQPUjkunaNTn0zew8YZ/ivy6cd
	tkcQcriP+Hz1GoTcmGYgnaagwhbB0tVVE/44fgtB1QEDTy7n+M7JVS+2NTfpuWvIApNddtweDPR
	4mIV9SQ==
X-Received: by 2002:a05:6a00:4b53:b0:83c:5e:f647 with SMTP id
 d2e1a72fcca58-842255cf600mr1474728b3a.29.1780096613112; Fri, 29 May 2026
 16:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528053204.46783-1-phucduc.bui@gmail.com> <177997780971.8579.10018213319147837982.b4-ty@b4>
In-Reply-To: <177997780971.8579.10018213319147837982.b4-ty@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 30 May 2026 06:16:41 +0700
X-Gm-Features: AVHnY4IY6tgEP3VCG4K8oj655J6EPIbOAjcJXkc4Xqtl62sL3VGjOhq5RTnW8xU
Message-ID: <CAABR9nEDhMRD8gpQALO54H3PcWMXyQp6_VqP4z8=deY_NFc=kQ@mail.gmail.com>
Subject: Re: [PATCH] regmap: reject volatile update_bits() in cache-only mode
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

Thanks for the review and for applying the patch.

Best regards,
Phuc
