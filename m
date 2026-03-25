Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E2381B0A
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 18:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774462295; cv=none; b=ACBpe0qtjLq612HBPGMfCSs8fn67oXSTYcWJYuhmsUBHKnQ51K9xpl9OrXNJDumy2VEcIIndBjMF/t+qKD+m4GYNDa9S8LvX/ywQSqNl/Ti1Aweb4qfHkQ0LoAaNi5ZZMFg44Y+72cuSrxaFVx3ofpS2GPEiF0m9O+O/Iemzbg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774462295; c=relaxed/simple;
	bh=UBwKxEoADOSTMP3lZyptRDYOtBtcnX3g1owjnqVBmIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpITwxlWfaawrEpZS4Lklhlc4SfE/1J0rS72AQVSih8y5ryocVW9kk85B3sZDE1jAvF4WuV52IpXfXsD8JF+uJ2adWnK8wUKxz5ONMVT6AccgGx3UpgaztWqCy1SVZkJb7qfA7H8EiEPGLPyouTpfxDL9UY6a8AiKfKDI6Hw6jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZvpHouq; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZvpHouq"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0ea57fea7so254176eec.0
        for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774462293; x=1775067093; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=584IxrfAi6B/ScV55kQLVZQPPg7Co7vyP0pW596N1Sc=;
        b=eZvpHouqNmGJEbA9FtXMCGoSSk/KcESzgNnjDc/7EUsquUpUSK36nWF5BW9VTh9h/C
         ZKWJ4X0UbKeq8h+zUrkMKYd4+yVeoHbl5Rk0hnmVsWSyPE6foJIIuGJ5l1VHRAfCVYT2
         PyyKAUHcuSSeOcGZ0ces5MnJloewUABfl/liMz18InL9IDQE7uwa3x/GvXwAIG+XxyQh
         nW0JyngDoW05Hc1vgLjVNJ9wZK91yj804VRFoUa4zNcJu07z2lFvJAJoRkVwatT9Jv0i
         T2H+4aZibjqYfq2qZGNeGsCtPAhsd6U4K3ViiraN0H1Yed71WLnJJMKHEvP87Aso1GRz
         fv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774462293; x=1775067093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=584IxrfAi6B/ScV55kQLVZQPPg7Co7vyP0pW596N1Sc=;
        b=p8xDWDYHi4JpdPkltdzQFw8oWzwVnnlgs5LB6zT7n5Rbja0N6+4lswaMvreHl3iAqR
         sVVuFaoDcednZAYjKFaCIOv6EDq03DkGi0c/vN2dUV81VDa2Td3vA1ENwQ6+Fo8t7Bj0
         x9wZiBwmLCjENbytNdwomKcl0tPKVVVAq/OWMez2AcrC7nXZsbp8EHy6XmnHy3AjlPzq
         kMUrhZjDvHa+vCLU0euDhN44cxCusnZatDMLc/iyY0fyRtj7s2c/51/VvFO1u4vhDNLW
         dcc5dD9kbox0cfHxByGZooTAz8nYTFslQEeC0CUt7QoCvS5qI/SulQfEFMgT6APoiD6K
         f3nw==
X-Forwarded-Encrypted: i=1; AJvYcCWDiQ+Uvrbzg4Agu5GpH/pJfpNlY5IB6JhDNCmECyr3D0y+oATowYiMnjOnvASZSpXfyzQ0cyuJxmqK6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YweqYnxqhTETBB2NLqlNQi+oo5hWs/vYchnir+LicfSBg+UubDR
	EsiS8rLXEJxUEesC0v6W09DEKczJ+M3c+CaZJs3cCLxu4Lgsz6pOaXPs
X-Gm-Gg: ATEYQzz3IwBSfgahybQj0vhw0tL8/Wc/4DCZr0h/HKjj6Jyx2RitXTeIxMb/SPoFdeD
	NpwJIA6D0Qfgz272CWkgsTvAa/R3JwU5lcGzW71AwmdcHLzQjpNKcia8KtmcpsVksw6/FD7dtIA
	fasc/aWD6e22zOoGmJt4IylI4TXe2Ekb+1Qm29OYdyf/WUJL8kzzcpuFT2/4NC4jEKFcmJS4VvF
	2wDKKw/kq8ZpOySgTFYudxs9M1onOwyNoIxmOqKWsVGkmAWuZly7RcPNH0+Uuel6rCFRrtRlLJe
	q7TsZQhbzT85V4oX/2RJLgZBQv5tiimqBQatjtKLggqWSxh9tlKyRTVKF0aYxBj4mAkXYko5/Fs
	KkMZ9ZCsSJvarFZ7hQ8wLQon+p4UtZJ28I329oBCBLvTyT2wlApUL71nkvg5zVVol1vQrojj7ot
	h/YXkL0grXJid7NDyB7qYQWmFmfjcnNvfjmx9qvPDBSWL9+yYg/3d169d8gVBFMUg8
X-Received: by 2002:a05:7300:2153:b0:2b7:b7e7:9025 with SMTP id 5a478bee46e88-2c15d42a129mr2169805eec.31.1774462293350;
        Wed, 25 Mar 2026 11:11:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec7f9c9sm543011eec.12.2026.03.25.11.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 11:11:32 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:11:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] software node: allow referencing software nodes by name
Message-ID: <acQkxvgndGyU9GLu@google.com>
References: <acIV6xF8mY-8wd5e@google.com>
 <CAMRc=MdJ0U2_ZQ5rP0Vmbv7+-xurf9F+WOwD3LwV=n5Fx33U=Q@mail.gmail.com>
 <acK69OColNT7ViLf@google.com>
 <CAMRc=Mcw66QpjQt4+_JdMq9JiAY28hjzNHa24gfOCCXyie-uRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcw66QpjQt4+_JdMq9JiAY28hjzNHa24gfOCCXyie-uRQ@mail.gmail.com>

On Wed, Mar 25, 2026 at 05:32:06PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 24, 2026 at 8:30 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Please post the reworked version so we can review all the details. My
> > concern was that it relies on notifier chains to notify when devices
> > get registered and unregistered, and instead of matching node names you
> > now need to somehow match device instances and software node instances,
> > which again likely is done based on some name. This just piles on
> > complexity where a simpler solution would be sufficient.
> >
> 
> I will post it. Hopefully before the end of the week. I want to cover
> both OF nodes with paz00 as well as ACPI with android tablets. The

For paz00 I hope Tierry will pick up my patch converting rfkill-gpio
from board file to dts.

> latter case will have to wait for devices because there's no way to
> look up an ACPI node by name that I could idenfity (correct me if I'm
> wrong).
> 
> > I think this approach also will give trouble when there are multiple
> > users of GPIOs provided by the same gpiochip, in cases where users are
> > split across multiple modules.
> >
> 
> Do we have any such use-case? I haven't found any. If we do end up
> running into this corner-case, it can still be done by centralizing
> the software nodes in question. But maybe let's cross that bridge when
> (and if) we get to it.

Android-tablet could probably use it. The gpiochip software nodes are
already consolidated there but the code could be simplified if we could
simply use names/labels.

Thanks.

-- 
Dmitry
