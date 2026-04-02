Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A96374E7D
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775159196; cv=none; b=QZTmWE40Ai5WY/I485CuJbjmS/SpdKMzVkTIB/lwGLRk3aT84XAmGz0F4py8ahZXPPCwxX9RTGXopFniEfCrEUd5eXc1O5bpRlkhbpU6uIEsKjFwPnE5EBXyvkWJ/MXqbK+Bi2T8BOkTVtPPjHp2Pb4aFN7kVKAysSio2/Waank=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775159196; c=relaxed/simple;
	bh=a9mBHdHYjDCom9dl6l1w9FC+LnPt+WHcW/12owPHJL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3/6y/TOBbaElaI/Na8LFSDib3LVWu8dlWNL9iVr5RLIFUmetD5E5ouAO0c+6n+jo/KKScJOdBj9HUTJl5yllqjpe4tQhkgmd95jiXytApRuXdre6Wn2/2FzlaqAFL1S+IVI2u+wVrz8sYkDQ6Wmy+xuH56HCddClb6VsWf/qwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaSpunRJ; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaSpunRJ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2795561eec.1
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775159194; x=1775763994; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ofPgXZblW8ELQEADO7eYp8kSVBKt5eY0/Ab8e9t8nZY=;
        b=KaSpunRJZcAAnlZcQzYoMIG1h6fIMqtOECJljKXl9LLeQ/65EUesMtLgBnBJgAqUQ/
         ijsmHmr2dUVEk4mJ+ILU5XOANhoiwqxkG792tEY3U31tXqK2QopZHiM2opKtoYM0sDO5
         F+uqBdyneJYmqsDGQfyqe/bpom3MFKwESq3EgaLhU+gwMXoPjdbanf3yVQjnoVI2iUWj
         NAo0ISWuWO5YL+n0ehRKcbpHfINLBTkp97UvR0fff2ZVxFFb3kNCiQkOSTxaULuTytPs
         rdU/A9ZHc72oO881vVZ33ao8mNPl2vdEVSwQvOMG4WAom5pVdbwRkZq/dbzLsi3VpNem
         pi1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775159194; x=1775763994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofPgXZblW8ELQEADO7eYp8kSVBKt5eY0/Ab8e9t8nZY=;
        b=DKWMZ6oVVEBOTKUqx49/3SCFbmNuEp+lJYz0Dh6PrHQr9N33D20/J3BG1pPdnp3RFS
         3iYd7RzQVO4rPyRIynli+7rHdZmbjpsyQC3/1ERXQUet+xY4q+2jaCVQ9/hazIy5yRno
         gC1+J419LEX1jhjP4x5MX+ek5ySvjBo8PJnjDuBCr3zvPUIuv6981tulh+pJP+ZuY2Bk
         z+cXulPfLipTqgMwyFQEbZ4JqjaMFDZn3/mrD/LS1f5tQ0wBTI31RjtN8L65nYsU/Vuz
         kcfD0r0/jNpHnhHdz5NQSc01SSw2cmIGyqFaUeef9U9CQJz1PHAcszbJKwbyHbz20x9N
         BH9A==
X-Forwarded-Encrypted: i=1; AJvYcCVeKxKivBDPIIqoe4PkFHztpLzcRDg9gw6e62Yx8e7v1mkvaxhYAiZd6ho3xUM1M2dBVjJn5porbkeeFw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxl64hVkVMuiZuwhLyHlvJlDTUgWDysNTGaDn/0Y7HSoS/eGRH
	hfWxiJdhNCmDnEPtnUWR75xpDgCprki0yzIwy5U7slI/hWQwHv9JsDs0
X-Gm-Gg: AeBDietwqWf+/qDVEny3rpBcSof/Png3z7hjNN4Ft7IRnMRZGTNEs8bCVgKFom4RcGi
	AX6VWiLXGz0stI09OIiY3vBNFlO7Tf25bUnuNUVNSH9M265b70gqcyRO98V0eP8zEXpoBTikx3M
	a1Trx6Zy4CUx/IdVlgHNJcZsl7u5lzvW3Smr4X+n9UWTCBHD7zQeq6cEiTfs3hoCSriTXFhtrzU
	X0NKp5Rqi3mMpI9QzrcOyQwQxjQN6X3/cgXsbyMS0Mz7LvRM1LfePLD/rWX9d4pjVQNKHwPglq4
	JCwA2tLcsAkF4vu05JjAICsDXIeuh34uoCsB1gdxKErhhKkGUolik8UYWLAMkA9YBwS2ooCx9Dj
	1ooNq1bZB8r18ODyjd7mLIcPvxkBstenBdb7SnCkmlOnG6/y3IMe6pmw1x1QejHnbjqyp9/b4i3
	6GhsvHiKq0naCwGT7CkiMIREqEX7FmzZwJYj3Zv8NSNNc6MuFVhQVCucmwVKU4sEfi
X-Received: by 2002:a05:7300:691d:b0:2b9:80c1:bb5 with SMTP id 5a478bee46e88-2cbfcd4876cmr252532eec.33.1775159193940;
        Thu, 02 Apr 2026 12:46:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca79e1d331sm3349493eec.13.2026.04.02.12.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 12:46:33 -0700 (PDT)
Date: Thu, 2 Apr 2026 12:46:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 2/4] software node: remove software_node_exit()
Message-ID: <ac7G9Vp68MgvV2rM@google.com>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-2-d730db3dd299@oss.qualcomm.com>
 <ac6XAyjxTct_WCEI@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac6XAyjxTct_WCEI@ashevche-desk.local>

On Thu, Apr 02, 2026 at 07:19:15PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 02, 2026 at 04:15:03PM +0200, Bartosz Golaszewski wrote:
> > software_node_exit() is an __exitcall() in a built-in compilation unit
> > so effectively dead code. Remove it.
> 
> a dead code

"
In technical writing, "dead code" is typically treated as an uncountable
noun, meaning it does not need the article "a" when referring to it as a
category or state.
"

Thanks.

-- 
Dmitry
