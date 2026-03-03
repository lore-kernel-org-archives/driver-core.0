Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD93D4DA557
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554994; cv=none; b=Bv5kslsxR/GYyxPDSimwwl3lf5k/zqR1vGYcoLUL+nLFKfg3J2DZ8x6OKR13AKOmyMkgqnyfxHAorbNLdIFfYhkNNGqMpXhwtENULfd44JnXBqbI1W7ue5H3qEvJgXbFvJt0R8OmsjhRiJFZdM7xqf1lNScGzE8F7YspG+CI+34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554994; c=relaxed/simple;
	bh=QnDe6CqK7d7iv5p2X8yN4ClZilCQfBmh+Ih5CDsKBrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QsYTOjeIFOit+wnTonGo7LLDIb/CTM+9+MHbtkZzP5aielgRSq9/GIKnXZQAHCGnPDsTlwPD8ndNY+ek4F/pTWfrYLEBylDskwX4VrGuRJ3+DZ8UZXsYveKPGBQi3/Ue2YTe6lcbb6HOwrAv8MPKLqNyy7PqbtHD/fitzj0hbwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7cOzEeN; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7cOzEeN"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba895adfeaso5100754eec.0
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 08:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772554987; x=1773159787; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42DkLzycZBouCea5OS9Ta3kLGIhHRc8gf8Jgyx1nJCE=;
        b=i7cOzEeNjS5AoJiPVYHZw8vbBzxmY7/IMWJCfQM3wO4Uew9OzOY+txP716GhcwIbKv
         4+tvmsp/PLqhjpNl3cwOti8YMTH6bWlmdMeapW3LFS+fk4gII2vCOhdQL3L1iEub/35g
         auJi2oU80ySBQK9C50ezUix8cl2Fv2oDpRukvRKWWqiCzYf8ZxMN4uioSjfxme+DTjxA
         X042jFdl3CC86pJrI8lmpOyImzQqcTckBoWOliI+bgt5NzUTEXtxrnyRt5+kV/+u4K9/
         fRxwWh9WrN/+csnNbQsJvqyuEUGmvgxqNkLF4IgaNxdQwDozponRdlxNjRAO7un85zTN
         1INw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772554987; x=1773159787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42DkLzycZBouCea5OS9Ta3kLGIhHRc8gf8Jgyx1nJCE=;
        b=VCQqgqBpq92PmY7uSX9u6oOQtoYpJIUOGvRRg3qPMnTF3L7PHA5lwd/leiV/rOrTpi
         ZbKDDhV8mQ1OspMHql4ckgMxAiLGFfL1C5wborT650L2qDIZ3uyXt73ADMEqQFKaHd2b
         FLofZWavBty6iSkdxWSsyfgWNmq8+rR50Zsx3ibOoMSLm1PktNzn8PlVAYT4CVCIu4YQ
         LJvePkOQEuOGTuqn+PqAj/M3FwC91dVMzjKk4XV1Rwh/DGJ1Ae1YDuL9Bpf0/o6P2pw7
         e1zs7uuVUZ0WwrVopLxdn2+O52LiUhDr85HwOt6BVJ5LAv1J/lRBsXJXmtGcBDslrC5X
         XWCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaeh+MrMjtZic5H4MjozW8akrulOaK2WOxwcSnBLPpGGNt0A6zn3NmNpKj0i551Au+6auAPWEYlUtB2g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5bpIV1biOTzuJjLRdqoxoPUbzWhPl9jxbRaay/hoGMI19zLn5
	EEnJwEUCW+Bbwoj6BAr1Gr9cXqVzw7cRJk5Xu5rP8P0YlrlaY3++JaOg
X-Gm-Gg: ATEYQzx/G/WwYbZIGsKkgNcuzNQTKYI+jx67ZI83paLgrvO0FPehpCSZpCpCFHkw728
	pETHQI07r2Bk7IPUD4p8/SHKk5uEFFxcs1D8Yf8akjEJMl0Z34d56PVGJV7Fkf1vobY5p4BbWZO
	t2TrMJOIk3BACn0ApVPje815NRoeMIQnTPIXDbliuTL0pANoeme+PAtpTwxRowokq/mHq6PCqaw
	04y4zF2LX6ukOj6dcxjBmzN59owr+viPQJZUUG/ur6wb9GmUNigVgEM/Qq3o/3ZCThB5Ycr3EfC
	FxV4luoRvzLRAIr5Qi9tkVb+1GYQrq1mIuXwQsxl3VUCg8Vq8EtUzEStmQTkiNpuiok1nIOpYWv
	xqlYFr6aFN21TpqjqLCktEetwnEShkwPUjYG9jyVBpZHdYJkEGVFUJnZA9r8I2p9V8nOcanAGKR
	S12xexl3aCX7NUUz87kUTTXYYSIfKBjHSReJ4as001EW9iWxw=
X-Received: by 2002:a05:693c:8151:b0:2be:2b16:b99f with SMTP id 5a478bee46e88-2be2b170190mr181320eec.13.1772554986631;
        Tue, 03 Mar 2026 08:23:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cefd7esm14967005eec.9.2026.03.03.08.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 08:23:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 08:23:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, srini@kernel.org,
	s.nawrocki@samsung.com, nuno.sa@analog.com,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
Message-ID: <b46c5757-b67d-4949-b8d8-54b799464b5d@roeck-us.net>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303115720.48783-4-dakr@kernel.org>

On Tue, Mar 03, 2026 at 12:53:20PM +0100, Danilo Krummrich wrote:
> Do not use driver_override as IRQ name, as it is not guaranteed to point
> to a valid string; use NULL instead (which makes the devm IRQ helpers
> use dev_name()).
> 
> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
