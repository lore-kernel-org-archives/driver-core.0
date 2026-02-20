Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601AA34DCE6
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 20:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771618289; cv=pass; b=fYTWPuBUbckpy2WhbOSeCvULWbS9SgHTCt2Zn2GCLvF6Os66wC845xRzN6vs0iLcp71cbpIBNE5zUD76+Z7fc0Z9wLwwUo1jcbQYq/jumXEtoEhLZruGC9hs9ptzmdb/0qRJ4FNWEJa6ZmW3VqIYlksTR+lyiZUlhv9dHSN43Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771618289; c=relaxed/simple;
	bh=8JIRve8c15z5WReqA76soUL+Zt57OlSrG42LMMnF8oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vrt6vh+MWzb3D77a7HjsLksotU/1cTQu/UCvIAgfGCaCo1UrlpLpnhOxayECFkDJe30358iiN/Jf1b/BFxpyYADYzN2iZ3tbzXt3Yy8p5aQ5x6FJwdwXCdxxT0Na+M/Pej0HpoO40zVNHwo3Cjag4jzhrkwNLgsqOt5JxzicU+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koEhlIHx; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koEhlIHx"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65a36583ef9so4892515a12.0
        for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 12:11:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771618287; cv=none;
        d=google.com; s=arc-20240605;
        b=b1Et+CmYCYsw4M3ZqxT1PzbL81lOhh/cj8chsDpCmYERrMP18b0YwJhK/bK8OG5vUy
         ajlpO6gD401HgyWcP+yjYsCW/4x07p444uZYMUDhprWlP3tRRAuwuR+6yYKaz3qivNNR
         VD/veF7DRJpU85GhXwFzvE/ThlXgYjB72CeiNCMfrADkN+34kXEyBXUWRcRgX2Nw3cZT
         vrxT8n6qOrRrSqdCs7SkAuj+hHfbFLxZjRDVS+knrqUtgkGs2nAH0LrN19Ui1n6hm3yo
         PNr1LX2CjmAu58HHzfQyt1YVrTvBM1LF/Tv9o2TcdR2r/RwduXyOpTXQsUcqnle5sesR
         iaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8JIRve8c15z5WReqA76soUL+Zt57OlSrG42LMMnF8oo=;
        fh=J3alGrjr0kutWQxb611v6KObDHkjBdIP4rGBTyKVLUA=;
        b=XkVuoOy+ezgKFe0n3xyLtXceJTTUXg5xrGvVXEvhozx/e3a4zb3A662GyXxpwJZJyd
         ZBoVCIEKGaPkOGpkwy2hLkWQE0yLAWvkgZVCxlL9J9HJh9q55E9M6eaA+8ls+SsLiAwL
         WTsSFLPSf27K15a5JVzxIEssErlJ5f45HEQ/IVVCmLf5ViYPAiYp2CKou1XdOktXken7
         NwhOefEvF2B5usuV3I3TQeHTtDNiJHS6u/VKfk5MpXa3M4JjtLLymwED0tYUkFhmdMUE
         /SIRkYRNCOyWWerP09n5lIjcmkc3Hw94wBOXUXHADY/ItMZCJvt0BrJb+O//0z39fqyK
         +RaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771618287; x=1772223087; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JIRve8c15z5WReqA76soUL+Zt57OlSrG42LMMnF8oo=;
        b=koEhlIHxXG96/yzN6CQ7ttb0EfOtY5KJhIbTDvdC/dYOZz5GzkLrqy3MLyO0V4rWam
         T6v4OST4Lc+BnucvM065PXen2Vm0cg6ROjDNPpESH1YOzn4DkAgw3w8HKwXrRVEopvHa
         bdP/v5rZd3mQ9xBXkoKDnFpK0FwxnW0WsqIfurnbrrYDyhy1WbhxSF7n+RSDhneCw9Vn
         2WUw+4t40Mudz6YoEIRjdTcUj+OejVH50EudawJ5YIbBDzqEJY/J/5hJk3nmX2MjZ9zT
         y/Lw0FuhwGhSOf2CJehaSxBmE3FcR+tojYkeL9yvGtMu3T9CI1q3BV2VBm4qOB0tFryf
         AdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771618287; x=1772223087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8JIRve8c15z5WReqA76soUL+Zt57OlSrG42LMMnF8oo=;
        b=n37S3WhNDS1glDn7bomhJ/NO+lPLHLL8iykCwmX+6uL4CVRaJGHXhKH8cuSb1nPk14
         ouYx5jqCyOnFnu+9zyTXnEuAO8+gpwcRf6AEtpml4zTgYzcsInYk8PBtaGs5/n6kzznj
         Bx7vO7o87qOTQa9M1WqkHgDSMmDyNG2n8gwHGw5YzHykFb5aO9xD9Vqy8FwqLsSfYUbt
         sKBpcvTT0M6LKlVW61Y1BnlHHMFiXsj7BT2YWSAuZRyrv44x+fDxj9CaAPX0KDAIZ/JV
         IAK5jeVR8SYJvD4BYVQMTAWXMdjKBi7EQ48DwTwfab9rS6YgePbd5GStlsy0SU6Zv2h0
         HcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBFpNv/W9ZkJC+vHrwM1lXqd/sC3dJidrBxE4rEvNacv6PrGbiGyu+D/3NCdKQOFsQxgeoAKiAIu2cGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCWy7RlIt//k/4nkTtsHG0AnZlKgJSSDkxAiwBVeuuUi+ZGxF0
	Iz9ASUk+RjMLuf5luLDqRPTOH+acBQ5zsCzt1rdI/icx7wlGjqUr/9XTlqieQKGm3zfeEjeGLJ2
	NcdTssvYGfKF7OotDlvb1ZNhDQWkD6l4nhbjLS6Q=
X-Gm-Gg: AZuq6aK6zPZfoi0u9jLCiAX8vqYZLQ7WJsXFpYCk2qpoLe5yY65fIrsV8p6nN6GwGoC
	KGLOIR0+GEvpVND88rsIDa0EG0q1c0ilAaU5bNe75kAVuO863ybYbjtqJdDqLAOHDIl9tsIvzO5
	Tasy9wD4ndM+kMph5AfD825yZ5xnA+0XNN3F2kWu9WLhpdPYG1C5iUImYDnVPa7QDEKhFQ1R2Xa
	eVhxdhmG0Q93XbkWqMbWfviRFYI90Xeg/M1QLJNyLwJHBT8gY7Q9wmvcBZIfjkOLKeO/WhtLtOD
	gxYIXntXgWtwNQBpznbP9jRVyvrD/hmajY7mPBDNaA==
X-Received: by 2002:a17:907:1b25:b0:b3a:8070:e269 with SMTP id
 a640c23a62f3a-b9081089466mr60024866b.14.1771618286359; Fri, 20 Feb 2026
 12:11:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-3-tjmercier@google.com>
 <aZh-orwoaeAh52Bf@slm.duckdns.org> <CAOQ4uxjgXa1q-8-ajSBwza-Tkv91tFP-_wWzCQPW+PwJMehEWA@mail.gmail.com>
 <aZi6_K-pSRwAe7F5@slm.duckdns.org>
In-Reply-To: <aZi6_K-pSRwAe7F5@slm.duckdns.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Feb 2026 22:11:15 +0200
X-Gm-Features: AaiRm51G-BEIzt0SxbA22TK8LiihbDavtfXN5tpD9EpODADyVmlHbWbL_HHf7gc
Message-ID: <CAOQ4uxjZZSRBwZ2ZL31juAUu0-sAUnPrJWvQuJ2NDaWZMeq0Fg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] kernfs: Send IN_DELETE_SELF and IN_IGNORED
To: Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, gregkh@linuxfoundation.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, jack@suse.cz, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 8:50=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Fri, Feb 20, 2026 at 07:15:56PM +0200, Amir Goldstein wrote:
> ...
> > > Adding a comment with the above content would probably be useful. It =
also
> > > might be worthwhile to note that fanotify recursive monitoring wouldn=
't work
> > > reliably as cgroups can go away while inodes are not attached.
> >
> > Sigh.. it's a shame to grow more weird semantics.
>
> Yeah, I mean, kernfs *is* weird.
>
> > But I take this back to the POV of "remote" vs. "local" vfs notificatio=
ns.
> > the IN_DELETE_SELF events added by this change are actually
> > "local" vfs notifications.
> >
> > If we would want to support monitoring cgroups fs super block
> > for all added/removed cgroups with fanotify, we would be able
> > to implement this as "remote" notifications and in this case, adding
> > explicit fsnotify() calls could make sense.
>
> Yeah, that can be useful. For cgroupfs, there would probably need to be a
> way to scope it so that it can be used on delegation boundaries too (whic=
h
> we can require to coincide with cgroup NS boundaries).

I have no idea what the above means.
I could ask Gemini or you and I prefer the latter ;)
What are delegation boundaries and NFS boundaries in this context?

> Would it be possible to make FAN_MNT_ATTACH work for that?
>

FAN_MNT_ATTACH is an event generated on a mntns object.
If "cgroup NS boundaries" is referring to a mntns object and if
this object is available in the context of cgroup create/destroy
then it should be possible.

But FAN_MNT_ATTACH reports a mountid. Is there a mountid
to report on cgroup create? Probably not?

Thanks,
Amir.
