Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F73806B0;
	Fri, 20 Mar 2026 16:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774023792; cv=none; b=TX/dU42A7lgtvHMXxSP2x96E7lmEIyAMlnsZ6fXIFSUijUpbU+tgf4banYvRAypM8+GzOithIFhzg0vAA+J2oR5e7JdfXj2xrlYMqAxSpYpWuLjgEiIj+87zgmp/Bm9EpgsH7dZIcrhTrr7kybhVrv1pqnOuB9c//G+dkdOfYqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774023792; c=relaxed/simple;
	bh=Jb6UVfBnqBa5i5YvBZT7viy6ZjrFQqcKroxRK8MSYQ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RsYNIRLKyes1nC5gqXGfZPZEQIN7+/VktVpwHbN8QiawwmH8UjP+H8qkxLYnwLvItN8Q4ju8MD8BqDasafR17kVFvaWCpBuXovfyUsCfkaEMf7yaEMNZAlx8fvcWdJxUqZKziVgX7W+NUdR874e/Fav+JefKFnIVZd8XiTbpeTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTEXwDeu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTEXwDeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD713C19425;
	Fri, 20 Mar 2026 16:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774023791;
	bh=Jb6UVfBnqBa5i5YvBZT7viy6ZjrFQqcKroxRK8MSYQ0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BTEXwDeuAU4T6uCoAz58vAh/h4ju+gBTuq0WbyFRrL859f6mmF/GoY2Fx4YSP1x00
	 r22KJkxpXtXe0J6b6E2GVUrtBbLG/CVX6EiL9LQ9Dki/9PLNVUlxTH/wp757q4OUow
	 dGbWSwVIUkIK9mj6aBr/ttt1EDhMHbtmp0HPaAzKHfQ4e+Pz/S1Ztxz6WiCiTmvkkg
	 iFlCxGssHspniNDW5fvYAKLj2ZswqUcILYbGgBWy3kEoFfQYVwRGOa2F8UnPOO78lp
	 O31DigU3efk0zidUvMuKZtbFYUNUxWS6ZOnqBmkdmgDOsvEOYEGQZA2j007Gz7ZZu3
	 ndFXWPb+JskKw==
Message-ID: <6ccdd7a76e32f6fa76d080dc599d5893ac5dd78c.camel@kernel.org>
Subject: Re: [PATCH v4] firmware_loader: add search= module option for
 multi-path firmware lookup
From: Jeff Layton <jlayton@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>,  Danilo Krummrich	 <dakr@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Michal Grzedzicki	 <mge@meta.com>,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 20 Mar 2026 12:23:08 -0400
In-Reply-To: <2026032019-reckless-grain-4eaa@gregkh>
References: <20260320-fw-path-v4-1-7547e2f0dc64@kernel.org>
	 <2026032019-reckless-grain-4eaa@gregkh>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-03-20 at 16:59 +0100, Greg Kroah-Hartman wrote:
> On Fri, Mar 20, 2026 at 11:32:29AM -0400, Jeff Layton wrote:
> > Refactor fw_get_filesystem_firmware() by extracting the per-path
> > firmware loading logic into a new fw_try_firmware_path() helper.
> >=20
> > Add a new firmware_class.search=3D module option that accepts a
> > ':'-separated list of firmware search directories. The firmware
> > lookup order is:
> >=20
> >   1. firmware_class.path=3D (single legacy path)
> >   2. firmware_class.search=3D (colon-separated paths)
> >   3. Built-in default paths (/lib/firmware/updates/..., /lib/firmware)
> >=20
> > A backslash can be used as an escape character, allowing a literal
> > ':' ('\:') or literal '\' ('\\') to be embedded in a pathname.
> >=20
> > Example:
> >=20
> >   firmware_class.search=3D/custom/path1:/custom/path2
> >=20
> > Suggested-by: Michal Grzedzicki <mge@meta.com>
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> > This version adds a new module option called "search=3D" to specify an
> > (escapable) search path. The search=3D path is tried after the original
> > (unescaped) path=3D string, but before the hardcoded search path.
> > ---
> > Changes in v4:
> > - Move search path to new search=3D option that is tried after path=3D
> > - Link to v3: https://lore.kernel.org/r/20260318-fw-path-v3-1-a701a08bc=
025@kernel.org
> >=20
> > Changes in v3:
> > - Allow '\' to escape a literal ':' or '\' in the string
> > - Link to v2: https://lore.kernel.org/r/20260318-fw-path-v2-1-8a106eb91=
eb4@kernel.org
> >=20
> > Changes in v2:
> > - switch to using ':' as path delimiter
> > - Link to v1: https://lore.kernel.org/r/20260318-fw-path-v1-1-7884d9bf6=
18f@kernel.org
> > ---
> >  drivers/base/firmware_loader/main.c | 224 ++++++++++++++++++++++++----=
--------
> >  1 file changed, 150 insertions(+), 74 deletions(-)
> >=20
> > diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmwar=
e_loader/main.c
> > index a11b30dda23be563bd55f25474ceff2153ddd667..0f58d996d3807a1f57dc924=
adbe657360fdfac1e 100644
> > --- a/drivers/base/firmware_loader/main.c
> > +++ b/drivers/base/firmware_loader/main.c
> > @@ -469,8 +469,8 @@ static int fw_decompress_xz(struct device *dev, str=
uct fw_priv *fw_priv,
> > =20
> >  /* direct firmware loading support */
> >  static char fw_path_para[256];
> > +static char fw_search_para[256];
> >  static const char * const fw_path[] =3D {
> > -	fw_path_para,
> >  	"/lib/firmware/updates/" UTS_RELEASE,
> >  	"/lib/firmware/updates",
> >  	"/lib/firmware/" UTS_RELEASE,
> > @@ -485,6 +485,82 @@ static const char * const fw_path[] =3D {
> >  module_param_string(path, fw_path_para, sizeof(fw_path_para), 0644);
> >  MODULE_PARM_DESC(path, "customized firmware image search path with a h=
igher priority than default path");
>=20
> Change this to say "single directory location" or something like that?
>=20
> > =20
> > +module_param_string(search, fw_search_para, sizeof(fw_search_para), 06=
44);
>=20
> "search_path"?
>=20
> Or "path_search"?
>=20
> Naming is hard :(
>=20

Indeed. I'm fine with a different name if that's the consensus.

> > +MODULE_PARM_DESC(search, "colon-separated list of firmware search path=
s, tried after path=3D (use '\\:' for literal ':', '\\\\' for literal '\\')=
");
> > +
> > +static int
> > +fw_try_firmware_path(struct device *device, struct fw_priv *fw_priv,
> > +		     const char *suffix,
> > +		     int (*decompress)(struct device *dev,
> > +				       struct fw_priv *fw_priv,
> > +				       size_t in_size,
> > +				       const void *in_buffer),
> > +		     const char *dir, int dirlen,
> > +		     char *path, void **bufp, size_t msize)
> > +{
> > +	size_t file_size =3D 0;
> > +	size_t *file_size_ptr =3D NULL;
> > +	size_t size;
> > +	int len, rc;
> > +
> > +	len =3D snprintf(path, PATH_MAX, "%.*s/%s%s",
> > +		       dirlen, dir, fw_priv->fw_name, suffix);
> > +	if (len >=3D PATH_MAX)
> > +		return -ENAMETOOLONG;
> > +
> > +	fw_priv->size =3D 0;
> > +
> > +	/*
> > +	 * The total file size is only examined when doing a partial
> > +	 * read; the "full read" case needs to fail if the whole
> > +	 * firmware was not completely loaded.
> > +	 */
> > +	if ((fw_priv->opt_flags & FW_OPT_PARTIAL) && *bufp)
> > +		file_size_ptr =3D &file_size;
> > +
> > +	/* load firmware files from the mount namespace of init */
> > +	rc =3D kernel_read_file_from_path_initns(path, fw_priv->offset,
> > +					       bufp, msize,
> > +					       file_size_ptr,
> > +					       READING_FIRMWARE);
> > +	if (rc < 0) {
> > +		if (!(fw_priv->opt_flags & FW_OPT_NO_WARN)) {
> > +			if (rc !=3D -ENOENT)
> > +				dev_warn(device,
> > +					 "loading %s failed with error %d\n",
> > +					 path, rc);
> > +			else
> > +				dev_dbg(device,
> > +					"loading %s failed for no such file or directory.\n",
> > +					path);
> > +		}
> > +		return rc;
> > +	}
> > +	size =3D rc;
> > +
> > +	dev_dbg(device, "Loading firmware from %s\n", path);
> > +	if (decompress) {
> > +		dev_dbg(device, "f/w decompressing %s\n",
> > +			fw_priv->fw_name);
> > +		rc =3D decompress(device, fw_priv, size, *bufp);
> > +		/* discard the superfluous original content */
> > +		vfree(*bufp);
> > +		*bufp =3D NULL;
> > +		if (rc) {
> > +			fw_free_paged_buf(fw_priv);
> > +			return rc;
> > +		}
> > +	} else {
> > +		dev_dbg(device, "direct-loading %s\n",
> > +			fw_priv->fw_name);
> > +		if (!fw_priv->data)
> > +			fw_priv->data =3D *bufp;
> > +		fw_priv->size =3D size;
> > +	}
> > +	fw_state_done(fw_priv);
> > +	return 0;
> > +}
> > +
> >  static int
> >  fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_p=
riv,
> >  			   const char *suffix,
> > @@ -493,10 +569,9 @@ fw_get_filesystem_firmware(struct device *device, =
struct fw_priv *fw_priv,
> >  					     size_t in_size,
> >  					     const void *in_buffer))
> >  {
> > -	size_t size;
> > -	int i, len, maxlen =3D 0;
> > +	int i;
> >  	int rc =3D -ENOENT;
> > -	char *path, *nt =3D NULL;
> > +	char *path;
> >  	size_t msize =3D INT_MAX;
> >  	void *buffer =3D NULL;
> > =20
> > @@ -511,83 +586,84 @@ fw_get_filesystem_firmware(struct device *device,=
 struct fw_priv *fw_priv,
> >  		return -ENOMEM;
> > =20
> >  	wait_for_initramfs();
> > -	for (i =3D 0; i < ARRAY_SIZE(fw_path); i++) {
> > -		size_t file_size =3D 0;
> > -		size_t *file_size_ptr =3D NULL;
> > -
> > -		/* skip the unset customized path */
> > -		if (!fw_path[i][0])
> > -			continue;
> > -
> > -		/* strip off \n from customized path */
> > -		maxlen =3D strlen(fw_path[i]);
> > -		if (i =3D=3D 0) {
> > -			nt =3D strchr(fw_path[i], '\n');
> > -			if (nt)
> > -				maxlen =3D nt - fw_path[i];
> > -		}
> > =20
> > -		len =3D snprintf(path, PATH_MAX, "%.*s/%s%s",
> > -			       maxlen, fw_path[i],
> > -			       fw_priv->fw_name, suffix);
> > -		if (len >=3D PATH_MAX) {
> > -			rc =3D -ENAMETOOLONG;
> > -			break;
> > -		}
> > +	/* Try the single customized path first */
> > +	if (fw_path_para[0]) {
> > +		int dirlen =3D strlen(fw_path_para);
> > =20
> > -		fw_priv->size =3D 0;
> > +		/* strip trailing newline */
> > +		if (fw_path_para[dirlen - 1] =3D=3D '\n')
> > +			dirlen--;
>=20
> Why don't we just do all the "parsing" and stripping at startup (and
> when a new option is written), so we don't have to do it each and every
> time we search for a firmware image?  That would put all of the
> "cleanup" logic in one place and reduce the churn a bit.
>=20
> Yes, it would require another local variable, but that should be fine.
>=20

Ok, I'll see what I can do.

Thanks,
--=20
Jeff Layton <jlayton@kernel.org>
