Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E155214204
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799776; cv=none; b=ZACCu1IRBTee8QMVnBqPVL4POlPpxbySFVIGYyLKzg1gtNI3XGrtyX3HM/OLBo3nzlx3FHOz/b8owdtiKIUAhPUzyPCLlD53yykZXGwq7O7zsL7enFT+NKMuDwOkbu/Yy5sAVKb2IYPXJ/Q6s7k3XWG0EBHEdTuGuyR4wMDhyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799776; c=relaxed/simple;
	bh=djOPmYWoeNimLqFwXdVlNm05PUTEChqquxAvg9xpcC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kic/SGRaiBQPHCki42HkKXUQlxTtX014C59/gCSqM1rIud96WAKYPrYDCimz76crQ2u6vjZjSEJZs8riMNGYPqCcPlcNhX0CBLdrpg7wYhhGjjZypvemrDai4lYxelTAUemn3jrimmakVtzaWiHa46aW3YZ42Jb+u/pxsfxqyNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-6314c3818baso8276595137.1
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 05:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799774; x=1780404574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liGOOEcMtPZ1HdAZqxa+mDSdvuD0EnhVAX4bTJyxGQA=;
        b=gtlctDE/NU1RPYINeQIe3WdaLtLZk1jOoSxckRko8kF56SZkhm57siH0pfSdaGjOwF
         EfIz0cglGshAjDVDP5t3IDnbFZlrLRTBbgVCPvURp4ZAa9830CtUz1vTR73DLivUihMN
         +ohoLiVb7yGA/UPqJWBAlTDzheiL6NjO9l327/DHCVPTC3YG/33q70qxdibyf/+/4J0p
         jFTfY8LmI372fLV1+y2MB5BwpyhosfMbof+6TZ6JibNoIiyf+WRrKwieSkSuGU6g9HJQ
         rHZ9xqXPB5IwRN6xxcEjS6NEvv7RDOcQRY45ra+rbI52LjWi2GuKWLsg9Prl+WveWuxo
         ZtXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/aPh1TOYvVtSTgnOWoKwBs8BX3RI+YtXXiemheTt29gE5chhVEwhLfRT8ChFPmUMj+QbYnEbV8kyr1tg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Tsz4igByOvd2W740XDmLOTGD9tHQlZIRn1LDY9gCW+PM76gQ
	v2VbPN0siY5b5nWE753ethAeddsRlSuywRiSmCs2SJB7jjDfKq77VHsXfo+NgMaI
X-Gm-Gg: Acq92OG9GxUTEZEGUuLW7J/1M1eqFdKbgTYI2Vc/oEJlmo6Oi9YZBWoJgOAdAOdSDYt
	1AYxC0O3bgm9eAQ2uVLC0sdnYlMzKWHHPCHd6w4fqwKWgpvegzeawXKscYZg1tHyfykyYWKaS4V
	B4NLlZua7dsNS7HqUoJzBGFSueaxjuB2dVzJRmA4SVMnOrSK3+0iqaDr+qAe321TJ6PE6HO7za8
	Z4x6io7KsyD/MPnuIJdbcGTW74T8NkstQT1SSi9mi4r8/PmMYZVppSrjdqwA0zZedhCDw7jyJtF
	Wpm1auTzcaksDCr5bOz51jTEbmBLSUqZiNZQbuHaVPVe+hVd+R3+GEz1eryDxn0QcS//LgI7xVR
	IZAVF5Q3J2ftlnoktUh08DXAsjsfjxlVZHGtJLurBau2CAD+bhtpOLeMOvD4IPC54YBZvLqsobR
	2fu6AQJhHrQ0qmTcQJv8dI2CYkSNIfEM62hGI8pEGvzFOXwKaizAMeRIODPbgI
X-Received: by 2002:a05:6102:5114:b0:631:4e9a:bab with SMTP id ada2fe7eead31-67c85c33d14mr8820562137.18.1779799774097;
        Tue, 26 May 2026 05:49:34 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fc9a0fd00sm13724135137.0.2026.05.26.05.49.32
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:49:33 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95f9d6a3a04so7743611241.0
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 05:49:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8zs2UDAFmH8zhxPTF+npbTxwuOt7RaEwfCRHSLypccLNk7oHzHf/G8p4KnlrH6J3+9x4mQazMNrqa1sw==@lists.linux.dev
X-Received: by 2002:a05:6102:4494:b0:631:44b7:b88c with SMTP id
 ada2fe7eead31-67c8839c3cfmr8282219137.20.1779799772517; Tue, 26 May 2026
 05:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525012340.3860581-1-dakr@kernel.org>
In-Reply-To: <20260525012340.3860581-1-dakr@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 May 2026 14:49:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVN6uNr5AvrRB3762eOi3q8xBY7BtJw98cVMtvU=cwmug@mail.gmail.com>
X-Gm-Features: AVHnY4JPnBQh0tqgf_FPNrpVOJzWMgEPRPlZg2wFhq1kiCMouRvQwES008Afn1I
Message-ID: <CAMuHMdVN6uNr5AvrRB3762eOi3q8xBY7BtJw98cVMtvU=cwmug@mail.gmail.com>
Subject: Re: [PATCH 1/2] driver core: Fix missing jiffies conversion in deferred_probe_extend_timeout()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Mon, 25 May 2026 at 03:23, Danilo Krummrich <dakr@kernel.org> wrote:
> mod_delayed_work() takes jiffies, not seconds. Thus, restore the dropped
> conversion.
>
> While at it, fix incorrect indentation.
>
> Fixes: 1137838865bf ("driver core: Use mod_delayed_work to prevent lost deferred probe work")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks, with both patches from this series applied, I am no longer
seeing the WARNING Biju reported[1], and thousands of "sync_state()
pending due to" and hundreds of "deferred probe pending" messages.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

[1] https://lore.kernel.org/20260526120306.184283-1-biju.das.jz@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
