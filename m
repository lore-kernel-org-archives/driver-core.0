Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD2034165B
	for <driver-core@lists.linux.dev>; Sat, 18 Apr 2026 06:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776493705; cv=pass; b=pLEqds5a23SdeX2tk0PjF+vyypUZOlsMttPhQHdV8Ex1MEM53ldkZMBiuHP5lPm6pHtCNTi15zOer63nzN/KE/KJgIDUvjgOjhtHGxIuvXFEFUI7IcyrbxRPcfQpUpsw+yH3knp03Ds9LW9GNtTar7JoULkWWYw2/HVL1XBic14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776493705; c=relaxed/simple;
	bh=q5sXUmmHRoxu8wAX7Z8moLBnkCLANJH3ZJjuZ5dac78=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hsh2VCAYZKNI/ghzcWjqLXkOq6ejdkxsoARN5IXy1s/gTv9m3hnAwjlqWJGY5EhQt41ERqFUl0jVVXg8qEwXKOiv+8u3MBTIpX9pC71UUtdkscYCa3ZW7WOYDoU/CuNTY5r45Y4er+AP0gaDCBDLXy9yt1RApUqJmA+M8YTBfo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGP7ainU; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGP7ainU"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6501c4857b2so1110860d50.3
        for <driver-core@lists.linux.dev>; Fri, 17 Apr 2026 23:28:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776493704; cv=none;
        d=google.com; s=arc-20240605;
        b=e6u5Arj0TZ1+SvEuANH+Vm/Nz2vMOpCkGjaecKoTqnNOOkXFLdw/274HCHcTuii1Es
         lOfnmhKaq9ICq/zqMruVBDxojmOLdLAfsCqFWkWjRLhXP2C+wCCFzJKWLn0Eqn5ul8up
         LNy/29c2sKd5Fzn+EUXq3DPEbreGWh4MbmOoWe73PpoihpwF6tLkjQ9tky90aIUr9jfJ
         Yyb6LSkLJP+iFnqhl/Ww3BEax8BjqDuxWsCqZLC0dXvOjK68h+IaKcKzcXJ9UcpfIf/6
         s8+LhKdCWxC8MQuOftIUCSkuSW1t7JreErDUVDkqhZf1C8UtmFSn6PqNvjI6vq0rSVsJ
         QHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VRGdNT5EVnDN4KpPjGoIdZF53jgO+iSGoqzCoge+7ig=;
        fh=4ZlYLeu3PvgsnyRYUyx4SwjHiS2rnfimnNtwlzIddy8=;
        b=XYk1J7BBbZ+H/a69sozY/GwFnzM8aAioIkW/tpd1Pwr5nVxGXtQZMDVehi312JDhiF
         fe7LJyLcX4Yhyr9PCPFflUa1M5To7nQj68bOInpeJ5hnubvJQ1OzfzRnsKB2iZd2Dyv/
         BqsVQWpVW9jBf1POBrCPF+WKiXP1Czu/bUWlS9nT/8xqw4cTkae0NLBCgYK7pucf0AZ0
         xlK2kA9skUZvuG09EROWuLN+7K9Xr/hjXYecfs2oSKHJbvqTSu+L/9wzZvGYIgDXprAV
         fdLmgVrDx4YxxPLcIZR7CoCKqiGxYQ2VCInPq9CMSo4a2v4fAm8nfOSVEjCPPiI/73NH
         CFyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776493704; x=1777098504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRGdNT5EVnDN4KpPjGoIdZF53jgO+iSGoqzCoge+7ig=;
        b=DGP7ainU98DN91B6gdQqrqoB2WmwiRE7qjDZ+QBVGEE1XkFNYbwtr+4s34ro/rC9uM
         P294jzXH0j/koYPHy1E6lK9zsTVwZJgClcqEYJbbyDc7SEmrPY1QbQyDvD0nzjQsiB9c
         22d1m9HBKuxHKCUh4j6Lo9LiDkg4vaMYZbL9WkRSPDH1IlmdHeokjrziYGIfYncFfk+4
         Qbraz8tGfDaKSP3U50Q1leI3NskZt2/7UJu6nYbxqCOUbfypf0CRGpTDW6QPXz8YTUsd
         hZOJ3gvSJXVKDPORiO6RjKziiFbQLQznjdnej5IpyVbKd53GJZ/oBe8Zb3R5JM4Aukjf
         QPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776493704; x=1777098504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRGdNT5EVnDN4KpPjGoIdZF53jgO+iSGoqzCoge+7ig=;
        b=qfvfN4bAI3x/iXkJiIowunHP0+6hDnL0DjCyiNMf7Ese7CmfMIB2GXxuw+vbFtF/Hp
         rCpc422XJiuMUtUt30WKnJqHByzB9IDdo6z9Gupgi30XOL8KOp/WAq7XLP11/Excd4ci
         gmBIrb+XgXFn2yX1X0lgWaIi/XB+iK24x81QpFmisdAaaIOcbI1Y8Mp3jS3xdWAjId7n
         GVxBlGPCDKROIW8NKtLsCxBWT0KpeJqRTAZcBZ0feC9rVc2vtE1rda2G+0BZPnaETy8s
         gxRx2rfqhA3CQqvM02JhYKpzRJTdKRFOk8JluOYivf3vrzz1egTfJsBMLRl+FLQNgOwa
         /RTA==
X-Forwarded-Encrypted: i=1; AFNElJ9SNVpp9OZuXSvXuVelBG4UjmKTFnqoJI+Seb/Adxk+qXiIZN/I7NsVmr+gSMB72i4TV526JYBREffsUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzDqt1uOvf5l4hy1Q7S4p7HYbzkUm/c3xXexR3PQn12HRZpNMj
	ajP1xbg9MYYwPuBXB+BGxfzKPWxvqjjLk0oUk83MMabzqEH9VPV6wMXPV+88/iXavhBkSLmdrST
	yTISiaoN4Ibp6q2YGpoLtTVl0DLCW88A=
X-Gm-Gg: AeBDievbWP26WaaucC56+9sJ9tBmRHaiK5gPyxOeGKerP7iDsDZqJkYeO9ZHK0/Kk/Q
	vmM8PRfSPwN/ufaSjVSfydnAmw+Ily0GpUAv4V23Nrf41ZH2Luc+A8LyPWI5dqN9q58XBKxUXjX
	ei3+51x3e6sEUSuRsfadr1j9o1Q0HQJWz77YVAgC6S8PNkRKH4se6YsDhCz96Ygq+h0oHGPzO66
	ER9eEX51FqeFcQmEzUfDh7Pt7xa4eIzzC62nqcyn+srEEem4NN4+effLLspdyS/5ExTpSXQXv3u
	31T7arO9l60GQRWUVVA=
X-Received: by 2002:a05:690e:4812:b0:651:cddf:8c2d with SMTP id
 956f58d0204a3-65310a558dcmr3722853d50.43.1776493703618; Fri, 17 Apr 2026
 23:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415085109.3267323-1-lgs201920130244@gmail.com> <mmcqvvqqq2yj65adm2prscpnxtbp5tljaxtbiqrwlfwpwd3slg@xniqactlghfc>
In-Reply-To: <mmcqvvqqq2yj65adm2prscpnxtbp5tljaxtbiqrwlfwpwd3slg@xniqactlghfc>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Sat, 18 Apr 2026 14:28:13 +0800
X-Gm-Features: AQROBzDREeOl9R0EzGYKW9fIL7PkN9hEOk9Qv3oFYdK7SQu9JTEYFKTiqBjhzxs
Message-ID: <CANUHTR8h3nKAXt1fh49h=c4Mj7mH62cA7HCUar9ut3gZCW_Y1A@mail.gmail.com>
Subject: Re: [PATCH] firmware_loader: fix device reference leak in firmware_upload_register()
To: Russ Weight <russ.weight@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tianfei zhang <tianfei.zhang@intel.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russ,

Thanks for reviewing.

On Sat, 18 Apr 2026 at 07:22, Russ Weight <russ.weight@linux.dev> wrote:
>
> Given that the free_fw_sysfs target is used only once and no longer
> falls through, I suggest we remove the free_fw_sysfs target
> altogether.
>
> Instead of:
>         goto free_fw_sysfs;
>
> Do:
>         put_device(fw_dev);
>         goto exit_module_put;
>
> - Russ
>
> >
> >  free_fw_upload_priv:
> >       kfree(fw_upload_priv);
> > --
> > 2.43.0
> >

Good point =E2=80=94 I agree that since free_fw_sysfs is now only used once
and no longer falls through, it makes sense to remove that label
entirely and switch the error path to put_device(fw_dev); goto
exit_module_put; directly.

I'll send v2 shortly.

Thanks,
Guangshuo
